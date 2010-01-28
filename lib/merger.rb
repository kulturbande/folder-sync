require 'scanner'

class Merger
  
  def initialize
    @scanner = Scanner.new
  end

  def merge(source, destination)
    puts "Source:"
    test(source)
    puts "Destination:"
    test(destination)
    #
    # mode: 1 :: source -> destination
    #      -1 :: destination -> source
    #
    merge_arrays(1, @scanner.scan_folder(source), @scanner.scan_folder(destination))
  end
  
  def test(folder)
    @scanner.scan_folder(folder).each do |node|
      puts "#{node.name} #{node.file_signature} - #{node.mtime}"
    end
  end
  
  private
    def merge_arrays(mode, source, destination)
      source.collect do |source_item|
        
      end
    end
end

# void merge(int lo, int m, int hi)
# {
#     int i, j, k;
# 
#     i=0; j=lo;
#     // vordere Hälfte von a in Hilfsarray b kopieren
#     while (j<=m)
#         b[i++]=a[j++];
# 
#     i=0; k=lo;
#     // jeweils das nächstgrößte Element zurückkopieren
#     while (k<j && j<=hi)
#         if (b[i]<=a[j])
#             a[k++]=b[i++];
#         else
#             a[k++]=a[j++];
# 
#     // Rest von b falls vorhanden zurückkopieren
#     while (k<j)
#         a[k++]=b[i++];
# }