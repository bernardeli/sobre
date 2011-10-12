class UsersController < InheritedResources::Base
  actions :show

  def show
    show! do |format|
      format.html { render :layout => 'themes/01' }
    end
  end

  private

  def resource
    @user = User.find_by_username(params[:username])
  end
end
