class UsersController < InheritedResources::Base
  actions :show

  private

  def resource
    @user = User.find_by_username(params[:username])
  end
end
