require 'spec_helper'

describe WelcomeController do
  let(:user) { Factory(:user) }
  before(:each) { sign_in user }

  describe "GET index" do
    it "redirects to dashboard if user is signed in" do
      get :index
      response.should redirect_to dashboard_index_path
    end
  end
end
