class UsersController < InheritedResources::Base
  actions :show

  def show
    show! do |format|
      format.html { render :layout => 'registrations' unless resource }
    end
  end

  private

  def resource
    @user = User.where(:username => /^#{params[:username]}$/i).first
  end
end
