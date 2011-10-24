require 'spec_helper'

describe UsersController do
  describe "GET show" do
    it "gets user by username" do
      user = Factory(:user, :username => 'Portnoy')

      get :show, :username => 'portnoy'
      assigns[:user].should == user
    end

    it "renders registrations layout if user is not found" do
      get :show, :username => 'mikeportnoy'
      response.should render_template("layouts/registrations")
    end
  end
end
