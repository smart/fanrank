require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Factory" do

  it "should create a valid Fan" do
    Factory(:fan).should be_valid
  end

  it "should create a valid TwitterProfile" do
    Factory(:twitter_profile).should be_valid
  end

end