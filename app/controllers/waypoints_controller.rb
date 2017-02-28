class WaypointsController < ApplicationController

  def create
    if request.xhr?
      waypoint = Waypoint.new
      waypoint.location = "POINT(#{params[:location][:lng]}) #{params[:location][:lat]} "
      if waypoint.save
        "hello"
      end
    else
      status 404
      alert('did not save')
    end
  end

end
