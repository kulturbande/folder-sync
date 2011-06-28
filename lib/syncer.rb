require 'merger'

class Syncer
  
  attr_accessor :direction, :source, :destination, :folder
  
  def initialize(source, destination)
    @source = source
    @destination = destination
    @direction = "source_destination"
  end
  
  def simulate
    
  end
  
  def calculate
    merger = Merger.new
    folder = merger.merge_folders(@source, @destination)
    folder.each do |node|
      puts node.name
      case @direction
        when "source_destination":
          node.delete! if node.directory == @destination
        when "destination_source":
          node.delete! if node.directory == @source
      end
    end
    folder
  end
  
  def from_source_to_destination
    @direction = "source_destination"
  end
  
  def from_destination_to_source
    @direction = "destination_source"
  end
  
end