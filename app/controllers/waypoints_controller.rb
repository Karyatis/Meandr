class WaypointsController < ApplicationController

  def create
    @waypoint = Waypoint.new(location: "POINT(#{params[:location][:lat]} #{params[:location][:lng]})")
    if @waypoint.save
      status 200
    else
      status 404
      alert('did not save')
    end
  end
end
