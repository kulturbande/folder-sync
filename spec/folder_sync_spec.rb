require 'folder_sync'#File.join(File.dirname(__FILE__), '..', 'folder_sync')
require 'spec_helper'

describe FolderSync do
  
  describe "source" do 
    
    it "should have a path if source directory exists" do
      @sync = generate_folder_sync
      @sync.source.should_not be_nil
    end
    
    it "should be nil if source directory doesn't exists" do
      @sync = generate_folder_sync(:source => "foo")
      @sync.source.should be_nil
    end
  end
  
  describe "destination" do 
    
    it "should have a path if destination directory exists" do
      @sync = generate_folder_sync
      @sync.destination.should_not be_nil
    end
    
    it "should be nil if destination directory doesn't exists" do
      @sync = generate_folder_sync(:destination => "foo")
      @sync.destination.should be_nil
    end
  end
end