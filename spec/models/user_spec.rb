require 'spec_helper'

describe User do
  before(:each) { Factory(:user) }

  it { should validate_uniqueness_of :username }
  it { should have_one :information }

  describe "validations" do
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
  end

  describe "after_save" do
    it "creates information association for user" do
      Factory(:user).information.should_not be_nil
    end
  end
end
