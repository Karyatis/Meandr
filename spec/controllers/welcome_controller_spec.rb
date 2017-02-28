require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      response.code.should == "200"
    end
  end
end
