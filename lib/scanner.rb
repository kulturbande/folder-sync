require 'find'
require 'node'

class Scanner
  
  def scan_folder(directory)
    folder = Array.new
    Find.find(directory) do |f|
      folder << Node.new(f[directory.length, f.length], directory) unless f == directory
      #folder << {:file => f[directory.length, f.length], :signature => file_signature(f)} unless f == directory
    end
    folder
  end

end