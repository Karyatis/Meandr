class Waypoint < ApplicationRecord
    # has_many :meanders


  def self.waypoints_in_radius_of(current_waypoint, search_radius) #point, distance
    Waypoint.all.select { |waypoint| waypoint.find_distance_to(current_waypoint) <= search_radius}
  end

  def closer_to_end(current_waypoint, destination)
    return self.find_distance_to(destination) < current_waypoint.find_distance_to(destination)
  end

  def distance(destination)
    #thing.location.x // thing.location.y
    x1 = location.x
    x2 = destination.location.x
    y1 = location.y
    y2 = destination.location.y
    Math.hypot(x2-x1,y2-y1)
  end

  def coordinates
    self.location.coordinates
  end
#doesn't need to exist anymore thanks to above
  def find_distance_to(destination)
    #change to call ^ distance on self instead of location
    self.distance(destination)
  end

  def search_radius(full_distance, modifier)
    #set standard modifier to be 0.1
    radius = full_distance * modifier
  end


end

  # def choose_next_waypoint(current_waypoint, destination, modifier)
  #   # find all waypoints within radius of current waypoint
  #   waypoints_in_radius = Waypoint.waypoints_in_radius_of(current_waypoint, search_radius)
  #   # select those that are closer to end point
  #   waypoints_nearer_destination = waypoints_in_radius.select { |waypoint| waypoint.closer_to_end(current_waypoint, destination)}
  #   # select one from ^ at random
  #   next_waypoint = waypoints_nearer_destination.sample
  # end

  # def route_path(current_waypoint, destination, modifier)
  #   # modifier = 0.3
  #   points_of_interest = []
  #   #will return nil if none were found
  #   next_waypoint = choose_next_waypoint(current_waypoint, destination, modifier)
  #   if next_waypoint == nil
  #     if modifier < 1
  #       modifier += 0.1
  #       next_waypoint = route_path(current_waypoint, destination, modifier)
  #     else
  #       break
  #       #stop adding points and route to destination
  #     end
  #   else
  #     points_of_interest << next_waypoint
  #     points_of_interest << route_path(next_waypoint, destination)
  #   end
  #   points_of_interest
  #   # add to aggregate array of coords/waypoints => return it
  # end
  # def meander(current_waypoint, destination)
  #   route_path(current_waypoint, destination, 0.3)
  # end
