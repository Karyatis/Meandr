# require 'spec_helper'
require 'rails_helper'
# require 'waypoint'

  describe Waypoint do

  let(:dbc) { Waypoint.new(location: 'POINT(41.876460 -86.653224)') }
  it "has coordinates" do
    expect(dbc.location.coordinates).to eq [41.876460, -86.653224]
  end

end
