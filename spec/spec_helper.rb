$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'folder_sync'
begin; require 'rubygems'; rescue LoadError; end
gem 'rspec'
require 'spec'
require 'spec/autorun'

def generate_folder_sync(folders = {})
  folders = {:source => 'test1', :destination => 'test2'}.merge(folders) 
  FolderSync.new( File.join(File.dirname(__FILE__), 'test_folders', folders[:source]),  
                  File.join(File.dirname(__FILE__), 'test_folders', folders[:destination])) 
end

def test_folder(folder)
  File.join(File.dirname(__FILE__), 'test_folders', folder)
end
