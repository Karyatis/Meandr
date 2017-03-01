class WaypointsController < ApplicationController

  def create
    p "X" * 150
    p "HERE"
    p params
    @waypoint = Waypoint.new(location: "POINT(#{params[:location][:lng]}) #{params[:location][:lat]} ")
    p @waypoint
    if @waypoint.save
      if request.xhr?
        render json: { status: 200, waypoint: @waypoint }
      else
        render json: { status: 422, alert: 'We were unable to save your location, please ensure GeoLocation is supported.'}
      end
    else
      if request.xhr?
        render json: { status: 422, alert: 'We were unable to save your location, please ensure GeoLocation is supported.'}
      else
        status 404
        alert('did not save')
      end
    end
  end

end
