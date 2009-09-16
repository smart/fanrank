require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Profile do

  it "sets a token on create" do
    Factory(:twitter_profile).token.should_not be_nil
  end

  xit "#set_token"

end
