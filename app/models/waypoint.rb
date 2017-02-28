class Waypoint < ApplicationRecord
    # has_many :meanders


  def self.waypoints_in_radius_of(current_waypoint, min_search_radius, max_search_radius) 
    #point, distance
    waypoint_text = current_waypoint.location.as_text
    sql_query = 
      "ST_DistanceSphere(location, ST_GeomFromText('#{waypoint_text}')) < #{max_search_radius} AND ST_DistanceSphere(location, ST_GeomFromText('#{waypoint_text}')) > #{min_search_radius}"
    Waypoint.where(sql_query)
  end

  def closer_to_end(current_waypoint, destination)
    return self.find_distance_to(destination) < current_waypoint.find_distance_to(destination)
  end

  def self.find_waypoints_closer_to_end(current_waypoint, destination)
    # #thing.location.x // thing.location.y
    # x1 = location.x
    # x2 = destination.location.x
    # y1 = location.y
    # y2 = destination.location.y
    # distance_start_to_end = Math.hypot(x2-x1,y2-y1)

    current_text = current_waypoint.location.as_text
    destination_text = destination.location.as_text
    sql_query = "ST_DistanceSphere(location, ST_GeomFromText('#{destination_text}')) < ST_DistanceSphere(ST_GeomFromText('#{current_text}'), ST_GeomFromText('#{destination_text}'))"
    Waypoint.where(sql_query)
  end

# set default modifier to 0.1 in variable?
  def search_radius(full_distance, modifier)
    #set standard modifier to be 0.1
    radius = full_distance * modifier
  end
  
  def distance_conversion(lat1, lat2)
    latMid = (Lat1+Lat2 )/2.0;
    m_per_deg_lat = 111132.954 - 559.822 * cos( 2 * latMid ) + 1.175 * cos( 4 * latMid);
    m_per_deg_lon = 111132.954 * cos( latMid );
  end
end