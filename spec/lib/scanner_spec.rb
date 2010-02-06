require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'scanner'
require 'node'

describe Scanner do
  
  before(:each) do
    @scanner = Scanner.new
    @folder = @scanner.scan_folder(test_folder('test1'))
  end
  
  it "should have 4 items" do
    @folder.should have(4).items
  end
  
  it "should be an instance of Node" do
    @folder.first.should be_an_instance_of(Node)
  end
  
  it "should have the name 'foo' as the first element" do
    @folder.first.name.should include("foo")
  end
  
end