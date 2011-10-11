class Devise::RegistrationsController < Devise::SessionsController
  before_filter :set_password_confirmation, :only => [:create, :update]

  private

  def set_password_confirmation
    params[:user][:password_confirmation] = params[:user][:password]
  end
end
