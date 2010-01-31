require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'merger'

describe Merger do
  
  before(:each) do
    @merger = Merger.new
  end
  
  it "should merge two folder structures" do
    @merger.merge_folders(test_folder("test1"), test_folder("test2")).should have(3).items
  end
end