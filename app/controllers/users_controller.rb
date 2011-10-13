class UsersController < InheritedResources::Base
  actions :show

  private

  def resource
    @user = User.where(:username => params[:username]).first
  end
end
