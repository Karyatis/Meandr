class WaypointsController < ApplicationController

  def create
    p '*' * 50
    p params[:location][:lng]
    @waypoint = Waypoint.new(location: "POINT(#{params[:location][:lat]} #{params[:location][:lng]})")
    if @waypoint.save
      status 200
    else
      status 404
      alert('did not save')
    end
  end

  # private

  # def waypoint_params
  #   # params.require(:waypoint).permit(:location)
  # end
end
