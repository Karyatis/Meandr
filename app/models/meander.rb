class Meander < ApplicationRecord
  # has_many :waypoints

  def choose_next_waypoint(current_waypoint, destination, modifier)
    # find all waypoints within radius of current waypoint
    waypoints_in_radius = Waypoint.waypoints_in_radius_of(current_waypoint, current_waypoint.search_radius(current_waypoint.find_distance_to(destination), modifier))
    # select those that are closer to end point
    waypoints_nearer_destination = waypoints_in_radius.select { |waypoint| waypoint.closer_to_end(current_waypoint, destination)}
    # select one from ^ at random
    next_waypoint = waypoints_nearer_destination.sample
  end

  def route_path(current_waypoint, destination, modifier, points_of_interest = [])
    next_waypoint = choose_next_waypoint(current_waypoint, destination, modifier)
    if next_waypoint == nil
      if modifier < 1.0
        modifier += 0.1
        next_waypoint = route_path(current_waypoint, destination, modifier, points_of_interest)
      else
        # exit
        # return
        return points_of_interest
        #stop adding points and route to destination
      end
    else
      # p "what is about to get pushed into the array?"
      # p next_waypoint
      # p '*'*20
      points_of_interest << next_waypoint
      # p "current points of interest array"
      # p points_of_interest
      # p '*'*20
      points_of_interest << route_path(next_waypoint, destination, 0.1, points_of_interest)
      # p "poi after the recursive push"
      # p points_of_interest
      # p '*'*20
    end
    # next_waypoint
     # points_of_interest
    # add to aggregate array of coords/waypoints => return it
  end

  def meander(current_waypoint, destination)
    path = route_path(current_waypoint, destination, 0.1)
    number = path.length/2
    number.times { path.pop }
    path
  end
end
