$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

def generate_folder_sync(folders = {})
  folders = {:source => 'test1', :destination => 'test2'}.merge(folders) 
  FolderSync.new( File.join(File.dirname(__FILE__), 'test_folders', folders[:source]),  
                  File.join(File.dirname(__FILE__), 'test_folders', folders[:destination])) 
end

def test_folder(folder)
  File.join(File.dirname(__FILE__), 'test_folders', folder)
end
