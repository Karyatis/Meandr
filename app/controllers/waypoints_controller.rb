class WaypointsController < ApplicationController

  def new
    waypoint = Waypoint.new
    if request.xhr?
      render partial: 'form', locals: {waypoint: waypoint}
    else
    end
  end


  def create
    waypoint = Waypoint.new(location: "POINT(#{params[:lng]}) #{params[:lat]} ", description: params[:description], dropped_by: params[:dropper])
    if waypoint.save
      if request.xhr?
        render json: { status: 200, waypoint: waypoint }
      end
    else
      if request.xhr?
        render json: { status: 422, alert: 'We were unable to save your location, please ensure GeoLocation is supported.'}
      end
    end
  end

end
