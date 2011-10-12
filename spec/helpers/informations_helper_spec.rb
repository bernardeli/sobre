require 'spec_helper'

describe InformationsHelper do
  describe "#social_network_to" do
    %w( twitter facebook linkedin orkut ).each do |network|
      context "when is #{network.to_s}" do
        it "returns link to #{network.to_s}" do
          result = helper.social_network_to(network.to_sym, 'john')
          result.should =~ /<a href="http:\/\/#{network}.com\//
          result.should =~ /john/
          result.should =~ /class="#{network}/
          result.should =~ /class="#{network}/
        end
      end
    end
  end

  describe "#social_network_url" do
    context "when is twitter" do
      it "returns twitter url" do
        helper.social_network_url(:twitter, 'john').should == 'http://twitter.com/john'
      end
    end

    context "when is facebook" do
      it "returns facebook url" do
        helper.social_network_url(:facebook, 'john').should == 'http://facebook.com/john'
      end
    end

    context "when is linkedin" do
      it "returns linkedin url" do
        helper.social_network_url(:linkedin, 'john').should == 'http://linkedin.com/in/john'
      end
    end

    context "when is orkut" do
      it "returns orkut url" do
        helper.social_network_url(:orkut, 'john').should == 'http://orkut.com/john'
      end
    end
  end
end
