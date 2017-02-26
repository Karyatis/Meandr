class Meander < ApplicationRecord
  # has_many :waypoints

  def choose_next_waypoint(current_waypoint, destination, modifier)
    # find all waypoints within radius of current waypoint
    waypoints_in_radius = Waypoint.waypoints_in_radius_of(current_waypoint, search_radius)
    # select those that are closer to end point
    waypoints_nearer_destination = waypoints_in_radius.select { |waypoint| waypoint.closer_to_end(current_waypoint, destination)}
    # select one from ^ at random
    next_waypoint = waypoints_nearer_destination.sample
  end

  def route_path(current_waypoint, destination, modifier)
    # modifier = 0.3
    points_of_interest = []
    #will return nil if none were found
    next_waypoint = choose_next_waypoint(current_waypoint, destination, modifier)
    if next_waypoint == nil
      if modifier < 1
        modifier += 0.1
        next_waypoint = route_path(current_waypoint, destination, modifier)
      else
        break
        #stop adding points and route to destination
      end
    else
      points_of_interest << next_waypoint
      points_of_interest << route_path(next_waypoint, destination)
    end
    points_of_interest
    # add to aggregate array of coords/waypoints => return it
  end
  def meander(current_waypoint, destination)
    route_path(current_waypoint, destination, 0.3)
  end

end
