require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Fan do
  before(:each) do
    @fan = Factory(:fan, :profiles => [Factory(:twitter_profile, :data => {
      :tweets => [{ :text => "one", :positive => true }],
      :followers => ["follower1", "follower2"] 
    })])
    @fan.save
  end

  it "computes a score" do
    @fan.score.should == 4.0
  end
  
  describe '#top_100' do
    
    before(:each) do
      @bigger_fan = Factory(:fan, :profiles => [Factory(:twitter_profile_with_data)])
      @bigger_fan.save
    end
  
    it "primary sorts the top 100 by score" do
      Fan.top_100.size.should == 2
      Fan.top_100.first.should == @bigger_fan
      Fan.top_100.last.should == @fan
    end
  
    it "secondary sorts the top 100 by fan.created_at" do
      @bigger_and_older_fan = Factory(:fan, :profiles => [Factory(:twitter_profile_with_data)])
      @bigger_and_older_fan.created_at = 1.day.ago
      @bigger_and_older_fan.save
      Fan.top_100.size.should == 3
      Fan.top_100.first.should == @bigger_and_older_fan
    end
    
  end

end
