class Waypoint < ApplicationRecord
    # has_many :meanders


  def self.waypoints_in_radius_of(current_waypoint, search_radius) #point, distance
    Waypoint.all.select { |waypoint| waypoint.find_distance_to(current_waypoint) <= search_radius}
  end

  def closer_to_end(current_waypoint, destination)
    return self.find_distance_to(destination) < current_waypoint.find_distance_to(destination)
  end

  def find_distance_to(destination)
    #thing.location.x // thing.location.y
    x1 = location.x
    x2 = destination.location.x
    y1 = location.y
    y2 = destination.location.y
    Math.hypot(x2-x1,y2-y1)
  end

# set default modifier to 0.1 in variable?
  def search_radius(full_distance, modifier)
    #set standard modifier to be 0.1
    radius = full_distance * modifier
  end


end


