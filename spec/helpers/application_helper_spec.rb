require 'spec_helper'

describe ApplicationHelper do
  describe "#selected_class" do
    context "when path is current path" do
      before(:each) { helper.stub(:current_page?).and_return true }
      it "returns active" do
        helper.selected_class(root_path).should == "selected"
      end
    end

    context "when path is not current path" do
      it "returns empty" do
        helper.selected_class(root_path).should == ""
      end
    end
  end

  describe "#theme_class" do
    context "when path is dashboard" do
      before(:each) { helper.stub(:current_page?).and_return true }
      it "returns signed in user theme" do
        user = Factory(:user)
        sign_in user
        helper.theme_class.should == 'theme-01'
      end
    end

    context "when path is not dashboard" do
      it "returns user theme" do
        @user = Factory(:user)
        @user.stub(:theme).and_return('theme-02')
        helper.theme_class.should == 'theme-02'
      end
    end
  end
end
