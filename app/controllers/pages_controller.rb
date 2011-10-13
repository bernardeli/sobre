class PagesController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :update

  private

  def resource
    current_user.page
  end
end
