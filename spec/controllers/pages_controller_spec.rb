require 'spec_helper'

describe PagesController do
  let(:user) { Factory(:user) }
  before(:each) { sign_in user }

  describe "PUT update" do
    it "render nothing" do
      put :update, :id => user.page.id
      response.should redirect_to success_dashboard_index_path
    end
  end
end
