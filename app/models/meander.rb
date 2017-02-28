class Meander < ApplicationRecord
  # has_many :waypoints


  def meander(current_waypoint, destination)
    # 150 m min
    min_search_radius = 150
    # 800 m max
    max_search_radius = 800
    distance_to_end = self.initial_distance(current_waypoint, destination)
    route_path(current_waypoint, destination, distance_to_end, min_search_radius, max_search_radius).slice(0..-2)
  end

  def route_path(current_waypoint, destination, distance_to_end, min_search_radius, max_search_radius, points_of_interest = [])
    next_waypoint = choose_next_waypoint(current_waypoint, destination, min_search_radius, max_search_radius)
    if points_of_interest.length > 20
      return points_of_interest
    end
    if next_waypoint == nil
      if max_search_radius < distance_to_end
        min_search_radius += 650
        max_search_radius += 650
        next_waypoint = route_path(current_waypoint, destination, min_search_radius, max_search_radius, points_of_interest)
      else
        return points_of_interest
        #stop adding points and route to destination
      end
    else
      points_of_interest << next_waypoint
      min_search_radius = 150
      max_search_radius = 800
      route_path(next_waypoint, destination, min_search_radius, max_search_radius, points_of_interest)
    end
    # add to aggregate array of coords/waypoints => return it
  end

  def choose_next_waypoint(current_waypoint, destination, min_search_radius, max_search_radius)
    current_waypoint.find_potential_next_waypoints(destination, min_search_radius, max_search_radius).sample
  end

  def initial_distance(start_point, end_point)
    long1 = start_point.location.x
    p long1
    long2 = end_point.location.x
    lat1 = start_point.location.y
    lat2 = end_point.location.y
    dtor = Math::PI/180
    r = 6378.14*1000

    rlat1 = lat1 * dtor 
    rlong1 = long1 * dtor 
    rlat2 = lat2 * dtor 
    rlong2 = long2 * dtor 

    dlon = rlong1 - rlong2
    dlat = rlat1 - rlat2

    a = (Math::sin(dlat/2)**2) + Math::cos(rlat1) * Math::cos(rlat2) * (Math::sin(dlon/2)**2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    d = r * c
  end

  def self.assemble_meander_coordinates(array_waypoints)
    array_waypoints.map { |waypoint| waypoint.location.coordinates }
  end
end
