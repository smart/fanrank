require 'spec_helper'

describe TwitterDataSource do

  it "should create a new instance given valid attributes" do
    Factory(:twitter_data_source).should be_valid
  end
end
