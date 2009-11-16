require 'digest'

class Node
  attr_accessor :name, :directory
  
  def initialize(name, directory)
    @name = name
    @directory = directory
  end
  
  def file
    File.join(@directory, @name)
  end
  
  def file_signature
    Digest::MD5.hexdigest(File.read(file)) unless File.directory?(file)
  end
  
  def mtime
    File.mtime(file)
  end
  
end