class MeandrsController < ApplicationController
  def create

    if request.xhr?
      start_point = Waypoint.new(location: "POINT(#{meandr_params[:startLongitude]} #{meandr_params[:startLatitude]})")
      end_point = Waypoint.new(location: "POINT(#{meandr_params[:endLongitude]} #{meandr_params[:endLatitude]})")
      meandr = Meander.new
      meandr_distance = meandr.initial_distance(start_point, end_point)
      if meandr_distance < 160000
        meandr_array = meandr.meander(start_point, end_point)
        meandr_coordinates = Meander.assemble_meander_coordinates(meandr_array)
        start_coordinates = start_point.location.coordinates.reverse
        end_coordinates = end_point.location.coordinates.reverse
        render json: { status: 200, start: start_coordinates, end: end_coordinates, waypoints: meandr_coordinates }
      else
        render json: { status: 422, alert: 'Please choose a closer meandr.' }
      end
    else
    end
  end

  private

  def meandr_params
    params.require(:meandr).permit(:startLatitude, :startLongitude, :endLatitude, :endLongitude)
  end
end


def swap_lat_lng(coords)
  coords = cords.reverse
end
