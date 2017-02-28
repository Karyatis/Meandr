class WaypointsController < ApplicationController

  def create
    p "*"*100
    p params
    @waypoint = Waypoint.new(location: "POINT(#{params[:location][:lng]}) #{params[:location][:lat]} ")
    if @waypoint.save
      if request.xhr?
        "hello"
      end
    else
      status 404
      alert('did not save')
    end
  end

end
