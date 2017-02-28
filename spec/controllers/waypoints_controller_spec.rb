require 'rails_helper'

RSpec.describe WaypointsController, type: :controller do
    before(:each) do
    @dbc = Waypoint.create!(location: 'POINT(-87.653217 41.876448)')
    @dugans = Waypoint.create!(location: 'POINT(-87.647490 41.879617)')
    @wise_owl = Waypoint.create!(location: 'POINT(-87.657240 41.876645)')
    @uic = Waypoint.create!(location: 'POINT(-87.656140 41.874853)')
    @blue_line = Waypoint.create!(location: 'POINT(-87.647180 41.875540)')
    @student_center = Waypoint.create!(location: 'POINT(-87.648000 41.871955)')
     @au_cheval = Waypoint.create!(location: 'POINT(-87.647670 41.884654)')
  end

  describe "POST #create" do
    it "creates a new waypoint in the database" do
      xhr :post, :create, waypoint:
      response.code.should == "200"
      # p '*' * 50
      # p Waypoint.count
      # p '*' * 50
      #   waypoints_count = Waypoint.count
      # @location = "POINT(-87.647180 41.875540)"
      #   xhr :post, :create, { waypoint: { location: @location} }
      #   new_waypoints_count = Waypoint.count
      #   expect(new_waypoints_count).to eq(waypoints_count + 1)
    end
  end
end
