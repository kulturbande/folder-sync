require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'syncer' 

describe Syncer do
  
  before(:each) do
    @syncer = Syncer.new
  end
  
  it "should have three modes" do
    
  end
  
  it "should simulate the sync" do
    @syncer.simulate(test_folder("test1"), test_folder("test2"))
    
  end
  
end