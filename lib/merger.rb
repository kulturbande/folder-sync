require 'scanner'

class Merger
  
  def initialize
    @scanner = Scanner.new
  end

  def merge(source, destination)
    @list = Array.new
    scan_list(@scanner.scan_folder(source), @scanner.scan_folder(destination))
    @list
  end
  
  private
    def scan_list(list1, list2)
      # get the last elements of both lists
      node2 = list2.last
      while list1.empty?
        node1 = list1.last
        case node1.name <=> node2.name
          when -1 then # node1
            @list << list1.pop
          when 0 then
            if node1.file_signature == node2.file_signature
              list1.pop # remove the element from the list
              list2.pop
            else
              if node1.mtime < node2.mtime
                @list << list2.pop
                list1.pop
                scan_list(list2,list1)
                break
              else
                @list << list1.pop
                list2.pop
              end
            end
          when 1 then # node2
            scan_list(list2, list1)
            break
        end
      end
      scan_list(list2, list1) unless list2.empty?
    end 
end