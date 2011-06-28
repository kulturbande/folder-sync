require 'digest'

class Node
  attr_accessor :name, :directory
  
  def initialize(name, directory)
    @name = name
    @directory = directory
    @delete_flag = false
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
  
  def delete!
    @delete_flag = true
  end
  
  def deleted?
    @delete_flag
  end
end