require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  integrate_views
  
  before(:each) do
    @second = Factory(:fan, :profiles => [Factory(:twitter_profile, :data => {
      :tweets => [{ :text => "one", :positive => true }],
      :followers => ["follower1", "follower2"] 
    })])
    @second.save
    @first = Factory(:fan, :profiles => [Factory(:twitter_profile_with_data)])
    @first.save
  end

  describe '#index' do
    it "displays the top 100 fans in order" do
      get :index
      assigns[:fans].size.should == 2
      assigns[:fans].first.should == @first
      assigns[:fans].last.should == @second
    end
  end
  
  describe '#twitter' do
    before(:each) do
      @unclaimed = Factory(:twitter_profile_with_data)
    end
    
    it "displays the top 100 twitter profiles in order" do
      get :twitter
      assigns[:profiles].size.should == 3
      assigns[:profiles].last.should == @second.profiles.first
    end
  end

end
