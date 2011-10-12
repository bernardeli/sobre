require 'spec_helper'

describe UsersController do
  describe "GET show" do
    it "gets user by username" do
      user = Factory(:user, :username => 'portnoy')

      get :show, :username => 'portnoy'
      assigns[:user].should == user
    end
  end
end
