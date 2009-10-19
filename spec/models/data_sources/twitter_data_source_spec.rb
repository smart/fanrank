require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe TwitterDataSource do 
  
  it "should create a new instance given valid attributes" do
    Factory(:twitter_data_source).should be_valid
  end
  
  it "should have the correct subscores" do 
    TwitterDataSource.subscores.should == [:reach, :mention, :vibe]
  end
  
end