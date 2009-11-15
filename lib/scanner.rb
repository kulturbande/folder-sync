require 'find'
require 'digest'
require 'node'

class Scanner
  
  def scan_folder(directory)
    folder = Array.new
    Find.find(directory) do |f|
      folder << Node.new(f[directory.length, f.length]) unless f == directory
      #folder << {:file => f[directory.length, f.length], :signature => file_signature(f)} unless f == directory
    end
    folder
  end
  
  def file_signature(file)
    Digest::MD5.hexdigest(File.read(file)) unless File.directory?(file)
  end
end