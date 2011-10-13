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
end
