require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DataSource do

  
  describe "#subscores" do
    
    it "should have a class method of subscore that returns the default value of []" do
      DataSource.subscores.should == []
    end
    
    it "should have an instance method of subscore that returns the default value of []" do 
      DataSource.new.subscores.should == []
    end
    
  end
end
