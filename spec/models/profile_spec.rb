require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Profile do
  
  it "sets a token on create" do
    Factory(:twitter_profile).token.should_not be_nil
  end

  it "is valid with too few subscore keys" do
    Factory.build(:twitter_profile, :subscores => { :reach => 1.0 }).should be_valid
  end

  it "is invalid with undefined subscore keys" do
    Factory.build(:twitter_profile, :subscores => { :foobar => 1.0 }).should_not be_valid
  end

  it "sorts the top 100 by score" do
    @twitter_profile = Factory(:twitter_profile)
    @twitter_profile_with_data = Factory(:twitter_profile_with_data)
    Profile.top_100.first.should == @twitter_profile_with_data
    Profile.top_100.last.should == @twitter_profile
  end

  context "with no data" do

    before(:each) do
      @twitter_profile = Factory(:twitter_profile)
    end

    it "has subscores of 0.0 for an empty profile" do
      @twitter_profile.subscores[:reach].should == 0.0
      @twitter_profile.subscores[:mention].should == 0.0
      @twitter_profile.subscores[:vibe].should == 0.0
    end

    it "has an aggregate score of 0.0" do
      @twitter_profile.score.should == 0.0
    end

  end

  context "with mentions and reach" do

    before(:each) do
      @twitter_profile = Factory(:twitter_profile_with_data)
    end

    it "has subscores greater than 0.0" do
      @twitter_profile.subscores[:reach].should == 3.0
      @twitter_profile.subscores[:mention].should == 2.0
      @twitter_profile.subscores[:vibe].should == 0.5
    end

    it "calculates an aggregate score" do
      @twitter_profile.score.should == 5.5
    end
  end


end
