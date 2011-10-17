require "spec_helper"

describe ContactMailer do
  let(:user) { Factory(:user) }
  let(:contact) { { :name => 'john',
                    :email => 'john@email.com',
                    :message => 'cool bro' } }

  describe "#contact_email" do
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

  describe "#welcome_email" do
    it "sends welcome email to user" do
      ContactMailer.welcome_email(user).deliver
      ActionMailer::Base.deliveries.last.to.should == [user.email]
    end

    it "sends email to user" do
      ContactMailer.welcome_email(user).deliver
      ActionMailer::Base.deliveries.last.body.should =~ /#{user.username}/
    end
  end
end
