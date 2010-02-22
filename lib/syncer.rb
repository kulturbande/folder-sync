require 'merger'

class Syncer
  
  attr_accessor :direction, :source, :destination, :folder
  
  def initialize(source, destination)
    @source = source
    @destination = destination
    @direction = "both"
  end
  
  def simulate
    
  end
  
  def calculate
    merger = Merger.new
    folder = merger.merge_folders(@source, @destination)
    if @direction == "source_destination"
      
    else
      
    end
  end
  
  def from_source_to_destination
    @direction = "source_destination"
  end
  
  def from_destination_to_source
    @direction = "destination_source"
  end
  
end