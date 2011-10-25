require 'spec_helper'

describe Page do
  describe "associations" do
    it "embeds one user object" do
      subject.associations.keys.should include 'user'
    end
  end

  describe "defaults" do
    it 'sets description default to empty string' do
      subject.description.should == ''
    end

    it 'sets theme default to 01' do
      subject.theme.should == '01'
    end
  end
end
