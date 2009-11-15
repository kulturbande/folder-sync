require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'scanner'
require 'node'

describe Scanner do
  
  before(:each) do
    @folder = test_folder('test1')
    @scanner = Scanner.new
  end
  
  it "should scan the folder structure" do
    folder = @scanner.scan_folder(@folder)
    folder.should have(4).items #['/Blub_folder', '/Blub_folder/blah', '/blub', '/blab']
    folder[0].should be_an_instance_of(Node)
  end
  
  it "should read the file signature" do
    @scanner.file_signature(@folder + '/blub').should have(32).items #'860ca753a4fab7206cb6fd4668eabe95'
  end
end