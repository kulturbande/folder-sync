require 'scanner'

class Merger
  
  def initialize
    @scanner = Scanner.new
  end
  
  def merge_folders(source_folder, destination_folder)
    source = @scanner.scan_folder(source_folder)
    destination = @scanner.scan_folder(destination_folder)
    mergesort(source.concat(destination))
  end
  
  private
    def mergesort(list)
      return list if list.size <= 1
      mid = list.size / 2
      left  = list[0, mid]
      right = list[mid, list.size]
      merge(mergesort(left), mergesort(right))
    end
  
    def merge(left, right)
      sorted_list = Array.new
      until left.empty? or right.empty?
        if left.first.name == right.first.name
          left_item = left.shift
          right_item = right.shift
          unless left_item.file_signature == right_item.file_signature
            (left_item.mtime > right_item.mtime) ? sorted_list << left_item : sorted_list << right_item 
          end
        elsif left.first.name < right.first.name
          sorted_list << left.shift
        else
          sorted_list << right.shift
        end
      end
      sorted_list.concat(left).concat(right)
    end
end