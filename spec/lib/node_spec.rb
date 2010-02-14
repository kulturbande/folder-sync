require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'node'

describe Node do
  
  before(:each) do
    @node = Node.new('/blab', test_folder('test1'))
  end
  
  it "should have a node name" do
    @node.name.should include('blab')
  end 
  
  it "should have a node directory" do
    @node.directory.should include('test')
  end
  
  it "should read the file signature" do
    @node.file_signature.should have(32).items
  end
  
  it "should get the modification time" do
    @node.mtime.should be_an_instance_of(Time)
  end
  
  it "should have an information flag" do
    @node.information_flag.should be_nil
  end
  
  it "should set the delete information" do
    @node.delete_node
    @node.information_flag.should == "deleted"
  end
  
end