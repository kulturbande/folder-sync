#require 'find'
#require 'digest'

class FolderSync
  attr_accessor :source, :destination
  
  def initialize(source, destination)
    @source = File.directory?(source) ? source : nil if source
    @destination = File.directory?(destination) ? destination : nil if destination
    # !(source == nil || @destination == nil)
  end
  
  def generate_merged_list
    source_list = get_folder_structure(source)
    destination_list = get_folder_structure(destination)
    # simple merge with two sort lists
    # with an alternate loop
    source_list.each do |source|
      destination_list.each do |destination|
        
      end
    end
  end
  
  # def get_folder_structure(directory)
  #   folder = Array.new
  #   Find.find(directory) do |f|
  #     folder << f[directory.length, f.length] unless f == directory
  #     #folder << {:file => f[directory.length, f.length], :signature => file_signature(f)} unless f == directory
  #   end
  #   folder
  # end
  
  private
    def file_signature(file)
      Digest::MD5.hexdigest(File.read(file)) unless File.directory?(file)
    end
end

# 1. Validates both given folders
# 2. scan the folder
# 3. merge both folders to one list with attributes
# 4. copy the files

folder_sync = FolderSync.new(ARGV[0], ARGV[1])
# if (source == nil || @destination == nil)
#   puts "Directory doesn't exists!"
# else
#   generate_merged_list
# end