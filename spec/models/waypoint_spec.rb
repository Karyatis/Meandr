# require 'spec_helper'
require 'rails_helper'
# require 'waypoint'

  describe Waypoint do

  let(:dbc) { Waypoint.new(location: 'POINT(41.876451 -87.653213)') }
  let(:dugans) { Waypoint.new(location: 'POINT(41.879618 -87.647487)') }
  let(:wise_owl) { Waypoint.new(location: 'POINT(41.876647 -87.657238)') }
  let(:uic) { Waypoint.new(location: 'POINT(41.874853 -87.656140)') }
  let(:blue_line) { Waypoint.new(location: 'POINT(41.875540 -87.647181)') }
  let(:student_center) { Waypoint.new(location: 'POINT(41.871955 -87.647998)') }
  let(:au_cheval) { Waypoint.new(location: 'POINT(41.884659 -87.647666)') }

  it "has coordinates" do
    expect(dbc.location.coordinates).to eq [41.876451, -87.653213]
  end

  it "finds the distance to another waypoint" do
    expect(dbc.find_distance_to(au_cheval)).to eq 0.009906587353870087
  end
end
