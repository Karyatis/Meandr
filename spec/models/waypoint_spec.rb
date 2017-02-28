require 'rails_helper'

describe Waypoint do

  before(:each) do
    @dbc = Waypoint.create!(location: 'POINT(-87.653217 41.876448)')
    @dugans = Waypoint.create!(location: 'POINT(-87.647490 41.879617)')
    @wise_owl = Waypoint.create!(location: 'POINT(-87.657240 41.876645)')
    @uic = Waypoint.create!(location: 'POINT(-87.656140 41.874853)')
    @blue_line = Waypoint.create!(location: 'POINT(-87.647180 41.875540)')
    @student_center = Waypoint.create!(location: 'POINT(-87.648000 41.871955)')
     @au_cheval = Waypoint.create!(location: 'POINT(-87.647670 41.884654)')
  end


  it "has coordinates" do
    expect(@dbc.location.coordinates).to eq [-87.653217, 41.876448]
  end

  describe "#waypoints_in_radius_of" do
    it "finds waypoints within search band" do
      expect(Waypoint.waypoints_in_radius_of(@dbc, 150, 500).length).to eq 2
    end

    it "returns an array of waypoint objects" do
      expect(Waypoint.waypoints_in_radius_of(@dbc, 150, 500)).to all(be_an_instance_of(Waypoint))
    end
  end

  describe "#find_waypoints_closer_to_end" do
    it "returns way points closer to the end point" do
      expect(Waypoint.find_waypoints_closer_to_end(@dbc, @au_cheval)).to include @dugans
    end

    it "returns an array of waypoint objects" do
      expect(Waypoint.find_waypoints_closer_to_end(@dbc, @au_cheval)).to all(be_an_instance_of(Waypoint))
    end
  end

  describe "find_potential_next_waypoints" do
    it "returns the next possible waypoints" do
      expect(@dbc.find_potential_next_waypoints(@au_cheval, 150, 800)).to eq [@dugans, @blue_line]
    end

    it "returns an array of waypoint objects" do
      expect(@dbc.find_potential_next_waypoints(@au_cheval, 150, 800)).to all(be_an_instance_of(Waypoint))
    end
  end
end



