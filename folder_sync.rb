#!/usr/bin/env ruby 

# == Synopsis 
#   This script allow you to sync two folders with each other.
#
# == Examples
#   This command does sync
#     folder_sync foo bar
#
#   Other examples:
#     ruby_cl_skeleton -q bar.doc
#     ruby_cl_skeleton --verbose foo.html
#
# == Usage 
#   folder_sync [options] source_folder destination_folder
#
#   For help use: folder_sync -h
#
# == Options
#   -h, --help          Displays help message
#   -v, --version       Display the version, then exit
#   -q, --quiet         Output as little as possible, overrides verbose
#   -V, --verbose       Verbose output
#   TO DO - add additional options
#
# == Author
#   Sascha Karnatz
#
# == Copyright
#   Copyright (c) 2010 Sascha Karnatz. Licensed under the MIT License:
#   http://www.opensource.org/licenses/mit-license.php

require 'optparse' 
require 'rdoc/usage'
require 'ostruct'
require 'date'


class FolderSync
  VERSION = '0.0.1'
  
  attr_reader :options
  attr_accessor :source, :destination

  def initialize(arguments, stdin)
    @arguments = arguments
    @stdin = stdin
    
    # Set defaults
    @options = OpenStruct.new
    @options.verbose = false
    @options.quiet = false
  end

  # Parse options, check arguments, then process the command
  def run
        
    if parsed_options? && arguments_valid? 
      
      puts "Start at #{DateTime.now}\n\n" if @options.verbose
      
      output_options if @options.verbose # [Optional]
            
      process_arguments            
      process_command
      
      puts "\nFinished at #{DateTime.now}" if @options.verbose
      
    else
      output_usage
    end
      
  end
  
  protected
  
    def parsed_options?
      
      # Specify options
      opts = OptionParser.new 
      opts.on('-v', '--version')    { output_version ; exit 0 }
      opts.on('-h', '--help')       { output_help }
      opts.on('-V', '--verbose')    { @options.verbose = true }  
      opts.on('-q', '--quiet')      { @options.quiet = true }
            
      opts.parse!(@arguments) rescue return false
      
      process_options
      true      
    end

    # Performs post-parse processing on options
    def process_options
      @options.verbose = false if @options.quiet
    end
    
    def output_options
      puts "Options:\n"
      
      @options.marshal_dump.each do |name, val|        
        puts "  #{name} = #{val}"
      end
    end

    # True if required arguments were provided
    def arguments_valid?
      # TO DO - implement your real logic here
      true if @arguments.length == 2 
    end
    
    # Setup the arguments
    def process_arguments
      # TO DO - place in local vars, etc
    end
    
    def output_help
      output_version
      RDoc::usage() #exits app
    end
    
    def output_usage
      RDoc::usage('usage') # gets usage from comments above
    end
    
    def output_version
      puts "#{File.basename(__FILE__)} version #{VERSION}"
    end
    
    def process_command
      # TO DO - do whatever this app does
      
      #process_standard_input # [Optional]
    end

    def process_standard_input
      input = @stdin.read      
      # TO DO - process input
      
      # [Optional]
      #@stdin.each do |line| 
      #  # TO DO - process each line
      #end
    end
end


# TO DO - Add your Modules, Classes, etc


# Create and run the application
folder_sync = FolderSync.new(ARGV, STDIN)
folder_sync.run

# class FolderSync
#   attr_accessor :source, :destination
#   
#   def initialize(source, destination)
#     @source = File.directory?(source) ? source : nil if source
#     @destination = File.directory?(destination) ? destination : nil if destination
#     prepare_sync
#   end
#   
#   def prepare_sync
#     return "Error! Can't find the source folder!" unless @source
#     return "Error! Can't find the destination folder!" unless @destination
#     
#     
#   end
# end
# 
# folder_sync = FolderSync.new(ARGV[0], ARGV[1])