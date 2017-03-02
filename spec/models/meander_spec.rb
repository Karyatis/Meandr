require 'rails_helper'

describe Meander do

  before(:each) do
    @meander = Meander.create!
    @dbc = Waypoint.create!(location: 'POINT(-87.653217 41.876448)')
    @dugans = Waypoint.create!(location: 'POINT(-87.647490 41.879617)')
    @wise_owl = Waypoint.create!(location: 'POINT(-87.657240 41.876645)')
    @uic = Waypoint.create!(location: 'POINT(-87.656140 41.874853)')
    @blue_line = Waypoint.create!(location: 'POINT(-87.647180 41.875540)')
    @student_center = Waypoint.create!(location: 'POINT(-87.648000 41.871955)')
     @au_cheval = Waypoint.create!(location: 'POINT(-87.647670 41.884654)')
  end

  describe "#assemble_meander_coordinates" do
    it "returns an array with reversed coordinates of the waypoints" do
      expect(Meander.assemble_meander_coordinates([@dbc, @uic])).to eq [[41.876448, -87.653217], [41.874853, -87.656140]]
    end
  end

  describe "#initial_distance" do
    it "returns the distance between the start point and end point" do
      expect(@meander.initial_distance(@dbc, @au_cheval)).to eq 1022.6561812623268
    end
  end

  describe "#choose_next_waypoint" do
    it "returns a possible next waypoint" do
      expect(@meander.choose_next_waypoint(@dbc, @au_cheval, 150, 800)).to be_an_instance_of Waypoint
    end
  end

  describe "#route_path" do
    it "returns an array of possible next waypoints" do
      expect(@meander.route_path(@dbc, @au_cheval, 1022.6561812623268)).to all(be_an_instance_of Waypoint)
    end
  end

  describe "#meander" do
    it "returns an array with a possible route" do
      expect(@meander.meander(@dbc, @au_cheval)).to all(be_an_instance_of Waypoint)
    end
  end
end
