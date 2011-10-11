require 'spec_helper'

describe DashboardController do
  let(:user) { Factory(:user) }
  before(:each) { sign_in user }

  describe "GET index" do
    it "is successful request" do
      get 'index'
      response.should be_success
    end
  end
end
