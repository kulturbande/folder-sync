require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'merger'

describe Merger do
  
  before(:each) do
    merger_class = Merger.new
    @merger = merger_class.merge_folders(test_folder("test1"), test_folder("test2"))
  end
  
  it "should get 3 items" do
    @merger.should have(3).items
  end
  
  it "should have Node object items" do
    @merger.first.should be_an_instance_of(Node)
  end
  
  it "should have blah as first item" do
    @merger.first.name.should include("blah") 
  end
  
  it "should have foo as last item" do
    @merger.last.name.should include("foo") 
  end
end