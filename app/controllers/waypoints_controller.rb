class WaypointsController < ApplicationController

  def new
    waypoint = Waypoint.new
    if request.xhr?
      render partial: 'form', locals: {waypoint: waypoint}
    else
    end
  end
  def create
    p "*"*100
    p params
    # also needs desc/dropped_by values
    waypoint = Waypoint.new(location: "POINT(#{params[:lng]}) #{params[:lat]} ", description: params[:description], dropped_by: params[:dropper])
    if waypoint.save
      if request.xhr?
        #this is where the message gets sent
        "hallo!"
      end
    else
      status 404
      alert('did not save')
    end
  end

end
