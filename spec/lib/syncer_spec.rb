require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'syncer' 

describe Syncer do
  
  before(:each) do
    @syncer = Syncer.new(test_folder("test1"), test_folder("test2"))
  end
  
  describe "direction" do
    it "should have a direction" do
      @syncer.direction.should == "both"
    end
     
    it "should have a direction from source to destination" do
      @syncer.from_source_to_destination
      @syncer.direction.should == "source_destination"
    end
    
    it "should have a direction from destination to source" do
      @syncer.from_destination_to_source
      @syncer.direction.should == "destination_source"
    end
  end
  
  describe "calculate" do
    
    before(:each) do
      @syncer.from_destination_to_source
      @folder_array = @syncer.calculate
    end
    
    it "should return an instance of Node" do 
      @folder_array.first.should be_an_instance_of(Node)
    end  
    
    it "should add delete information to Node" do
      @folder_array[1].deleted?.should be_true
    end
    
  end
  
  it "should simulate the sync" do
    @syncer.simulate
    
  end
  
end