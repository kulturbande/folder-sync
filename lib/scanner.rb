require 'find'
require 'node'

class Scanner
  
  def scan_folder(directory)
    folder = Array.new 
    Find.find(directory) do |f| 
      folder << Node.new(f[directory.length, f.length], directory) unless File.stat(f).directory? #f == directory
    end
    folder
  end

end