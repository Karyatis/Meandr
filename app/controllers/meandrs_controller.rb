class MeandrsController < ApplicationController
  def create
    # p "Patrick & Joel are the shiznit!"
    # p params  # <ActionController::Parameters {"meandr"=>{"startLatitude"=>"41.8760906", "startLongitude"=>"-87.6530576", "endLatitude"=>"41.902839", "endLongitude"=>"-87.70705809999998"}, "controller"=>"meandrs", "action"=>"create"} permitted: false>

    # p meandr_params # <ActionController::Parameters {"startLatitude"=>"41.8760906", "startLongitude"=>"-87.6530576", "endLatitude"=>"41.902839", "endLongitude"=>"-87.70705809999998"} permitted: true>

    if request.xhr?
      # Waypoint.create(location: 'POINT(41.876451 -87.653213)')
      start_point = Waypoint.new(location: "POINT(#{meandr_params[:startLatitude]} #{meandr_params[:startLongitude]})")
      end_point = Waypoint.new(location: "POINT(#{meandr_params[:endLatitude]} #{meandr_params[:endLongitude]})")
      p start_point
      p end_point
    else
    end
  end

  private

  def meandr_params
    params.require(:meandr).permit(:startLatitude, :startLongitude, :endLatitude, :endLongitude)
  end
end
