# require 'spec_helper'
require 'rails_helper'
# require 'waypoint'

RSpec.describe Waypoint, :type => :model do

  let(:dbc) { Waypoint.new(location: 'POINT(41.876460 -86.653224)') }
  it "has coordinates" do
    expect(dbc.location.coordinates).to_equal [41.876460, -86.653224]
  end

end
