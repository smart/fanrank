require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProfilesController do

  describe "#link" do

    it "assigns a profile by token" do
      profile = Factory(:twitter_profile)
      post :link, :token => profile.token, :email_address => "joeuser@coolmail.com"
      assigns[:profile].should eql(profile)
    end

    xit "does not assign a profile if it cannot be found by token" do
      post :link, :token => "1241412412412", :email_address => "joeuser@coolmail.com"
      assigns[:profile].should be_nil
      response.response_code.should_not == 404
    end

    it "links a profile and a fan" do
      profile = Factory(:twitter_profile)
      fan = Factory(:fan)
      post :link, :token => profile.token, :email_address => fan.email_address
      assigns[:profile].fan_id.should eql(fan.id)
    end

    it "redirects to FanController#create if a matching fan is not found" do
      profile = Factory(:twitter_profile)
      post :link, :token => profile.token, :email_address => "joeuser@coolemail.com"
      response.should be_redirect
    end

  end

end
