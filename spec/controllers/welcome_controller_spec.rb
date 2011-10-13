require 'spec_helper'

describe WelcomeController do
  describe "GET get_started" do
    it "should be successful" do
      get :get_started
      response.should be_success
    end
  end
end
