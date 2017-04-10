class Waypoint < ApplicationRecord
    # has_many :meanders

  # Returns points in our circular search band
  def self.waypoints_in_radius_of(current_waypoint, min_search_radius, max_search_radius)
    rando = 'SPHEROID["WGS 84", 6378137, 298.257223563]'
    waypoint_text = current_waypoint.location.as_text
    sql_query =
      "ST_Distance_Spheroid(location, ST_GeomFromText('#{waypoint_text}'), '#{rando}') < #{max_search_radius} AND ST_Distance_Spheroid(location, ST_GeomFromText('#{waypoint_text}'), '#{rando}') > #{min_search_radius}"
    Waypoint.where(sql_query)
  end

  # Returns points closer to the endpoint
  def self.find_waypoints_closer_to_end(current_waypoint, destination)
    current_text = current_waypoint.location.as_text
    destination_text = destination.location.as_text
    sql_query = "ST_DistanceSphere(location, ST_GeomFromText('#{destination_text}')) < ST_DistanceSphere(ST_GeomFromText('#{current_text}'), ST_GeomFromText('#{destination_text}'))"
    Waypoint.where(sql_query)
  end

  # compares the two arrays and returns array of potential next waypoints in radius and closer to destination.
  # Good on standalone test
  def find_potential_next_waypoints(destination, min_search_radius, max_search_radius)
    waypoints_in_band = Waypoint.waypoints_in_radius_of(self, min_search_radius, max_search_radius)
    waypoints_closer = Waypoint.find_waypoints_closer_to_end(self, destination)
    waypoint_options = (waypoints_in_band & waypoints_closer)
  end
end
