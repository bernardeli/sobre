class PagesController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :update

  def update
    update! do |format|
      format.html { render :nothing => true  }
    end
  end

  private

  def resource
    current_user.page
  end
end
