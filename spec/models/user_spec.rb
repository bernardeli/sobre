require 'spec_helper'

describe User do
  before(:each) { @user = Factory(:user) }

  it { should validate_uniqueness_of :username }
  it { should have_one :information }


  describe "validations" do
    it "validates presence of on update" do
      @user.username = ''
      @user.valid?.should be_false
      @user.errors.get(:username).should_not be_empty
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

  describe "after_save" do
    it "creates information association for user" do
      Factory(:user).information.should_not be_nil
    end
  end
end
