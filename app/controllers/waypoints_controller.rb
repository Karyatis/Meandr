class WaypointsController < ApplicationController

  def new
    waypoint = Waypoint.new
    if request.xhr?
      render partial: 'form', locals: {waypoint: waypoint}
    else
    end
  end
  def create
    # also needs desc/dropped_by values
    @waypoint = Waypoint.new(location: "POINT(#{params[:location][:lng]}) #{params[:location][:lat]} ")
    if @waypoint.save
      if request.xhr?
        #this is where the message gets sent
      end
    else
      status 404
      alert('did not save')
    end
  end

end
