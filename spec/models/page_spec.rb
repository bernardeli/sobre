require 'spec_helper'

describe Page do
  describe "associations" do
    it "embeds one user object" do
      subject.associations.keys.should include 'user'
    end
  end
end
