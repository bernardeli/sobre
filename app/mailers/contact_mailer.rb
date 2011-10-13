class ContactMailer < ActionMailer::Base
  default :to => 'ricardobcs@gmail.com'

  def contact_email(contact_info)
    @contact_info = contact_info.symbolize_keys

    mail(:from => 'contato@sob.re',
         :subject => "[Sob.re Contato] #{@contact_info[:name]} - #{@contact_info[:email]}",
         :date => Time.now)
  end
end
