require 'spec_helper'

describe User do
  describe "associations" do
    it "embeds one page object" do
      subject.associations.keys.should include 'page'
    end
  end

  describe "validations" do
    it { should validate_presence_of :username }

    it "should validate uniqueness of username" do
      user_created = Factory(:user)
      user = Factory.build(:user, :username => user_created.username)
      user.valid?.should be_false
      user.errors.get(:username).should_not be_empty
    end

    context "when username is alphanumeric" do
      %w( test te_st 1test test2test ).each do |username|
        it "is valid" do
          Factory.build(:user, :username => username).should be_valid
        end
      end
    end

    context "when username is not alphanumeric" do
      %w( test- %test _-test @#test test.test ).each do |username|
        it "is not valid" do
          Factory.build(:user, :username => username).should_not be_valid
        end
      end
    end

    context "when email is in a valid format" do
      %w( teste@teste.com.br test@gmail.com test.test@gmail.com test_test@gmail.com ).each do |email|
        it { should validate_format_of(:email).with(email) }
      end
    end

    context "when email is in a invalid format" do
      %w( teste@teste testgmail.com test.test_gmail.com test_test@gmail ).each do |email|
        it { should validate_format_of(:email).not_with(email) }
      end
    end
  end

  describe "after_create" do
    it "creates page association for user" do
      Factory(:user).page.should_not be_nil
    end

    it "sends welcome email" do
      user = Factory.build(:user)
      ContactMailer.should_receive(:welcome_email).with(user).and_return(mock(ContactMailer, :deliver => true))
      user.save
    end
  end
end
