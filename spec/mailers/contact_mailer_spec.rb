require "spec_helper"

describe ContactMailer do
  let(:contact) { { :name => 'john',
                    :email => 'john@email.com',
                    :message => 'cool bro' } }

  it "sends email to email set on to" do
    ContactMailer.contact_email(contact).deliver
    ActionMailer::Base.deliveries.last.to.should == %w( ricardobcs@gmail.com )
  end

  it "sets subject to [Sob.re Contato] + email" do
    ContactMailer.contact_email(contact).deliver
    ActionMailer::Base.deliveries.last.subject.should == "[Sob.re Contato] john - john@email.com"
  end

  it "sets body to contact[message]" do
    ContactMailer.contact_email(contact).deliver
    ActionMailer::Base.deliveries.last.body.should =~ /cool bro/
  end
end
