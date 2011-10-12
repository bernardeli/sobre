class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    render :layout => 'themes/01'
  end
end
