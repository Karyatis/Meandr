require 'rails_helper'

RSpec.describe MeandrsController, type: :controller do
  describe "POST #create" do
    it "responds with a code 200" do
      post :create, meander:
      response.code.should == "200"
    end


  end
end
