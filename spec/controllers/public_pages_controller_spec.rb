require 'spec_helper'

describe PublicPagesController do
  let(:parameters) { { "name" => "ricardo",
                       "email" => "ricardobcs@gmail.com",
                       "message" => "message cool" } }

  describe "GET get_started" do
    it "should be successful" do
      get :get_started
      response.should be_success
    end
  end

  describe "GET contact" do
    it "should be successful" do
      get :contact
      response.should be_success
    end
  end

  describe "POST dispatch_email" do
    it "sends the contact email" do
      ContactMailer.should_receive(:contact_email).with(parameters).and_return(mock(ContactMailer, :deliver => true))
      xhr :post, :dispatch_email, :contact => parameters
    end

    it "sets flash notice when email is not sent successfully" do
      ContactMailer.stub(:contact_email).and_return(mock(ContactMailer, :deliver => false))
      xhr :post, :dispatch_email, :contact => parameters
      flash[:notice].should == "Oops. Houve algum problema ao enviar a mensagem"
    end

    it "sets flash notice when email is sent successfully" do
      ContactMailer.stub(:contact_email).and_return(mock(ContactMailer, :deliver => true))
      xhr :post, :dispatch_email, :contact => parameters
      flash[:notice].should == 'Mensagem enviada.'
    end
  end
end
