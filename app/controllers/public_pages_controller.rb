class PublicPagesController < ApplicationController
  layout 'registrations'
  respond_to :js

  def dispatch_email
    if validate_params! and ContactMailer.contact_email(params[:contact]).deliver
      flash[:notice] = "Mensagem enviada."
    else
      flash[:notice] = "Oops. Houve algum problema ao enviar a mensagem"
    end
  end

  private

  def validate_params!
    params[:contact][:email].present? and params[:contact][:name].present? and params[:contact][:message].present?
  end
end
