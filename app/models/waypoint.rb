class Waypoint < ApplicationRecord

  def self.waypoints_in_radius_of(current_waypoint, search_radius) #point, distance
    waypoints_in_radius = Waypoint.all.select { |waypoint| waypoint.find_distance_to(current_waypoint) <= search_radius}
  end

  def closer_to_end(current_waypoint, destination)
    return self.find_distance_to(destination) < current_waypoint.find_distance_to(destination)
  end

  def coordinates
    self.location.coordinates
  end

  def find_distance_to(destination)
    self.location.distance(destination.location)
  end

  def search_radius(full_distance, modifier)
    #set standard modifier to be 0.3
    radius = full_distance * modifier
  end

  def meander()
    # find all waypoints within radius of current waypoint
    # select those that are closer to end point
    # select one from ^ at random
    # add to aggregate array of coords/waypoints => return it
  end

end

    # legal_waypoints = waypoints_in_radius.select { |waypoint| waypoint.closer_to_end(current_waypoint, destination)}

