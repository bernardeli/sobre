require 'spec_helper'

describe User do
  before(:each) { Factory(:user) }

  it { should validate_uniqueness_of :username }
end
