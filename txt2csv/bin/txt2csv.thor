#!/usr/bin/env ruby
# this first line is how the operating system knows to use ruby to execute this file
# use chmod oug+x txt2csv to make sure the file is executable
require 'thor'

class Txt2csv < Thor
	desc "convert", "convert files to csv format"
  def convert
    # takes 4 options: -p for prefix, -s for suffix, -i for input, -o for output
  end

  desc "analyze", "analyze stuff and output things"
  option :i, aliases: ['--input']
  option :o, aliases: ['--output']
  option :s, aliases: ['--suffix']
  option :p, aliases: ['--prefix']

  # this needs to go in the analyze method since we need to 
  File.readlines(options[:i]) do |line|
    line_array = line.split("\t")
    name = line_array.shift
    analyze(name)
  end

  def analyze(name)
    # Get the input filename from the command line interface, and open the file for reading
    # Get the output filename from the command line interface and open a histogram file for writing
    # Get the prefix or suffix suffix option from the command line interface
    # For each line in the incoming file,
    #   Split the line on tabs
    #   Hand the name field to the analyze method
    #   collect the reverse-sorted histogram returned from the method

    #send name field to name_parse method along with prefixes and suffixes Q? How do we access these variables?
    #parse method returns parsed_string; index 0 is preffix; index -1 is suffix
    #create histogram with default 0.
  	if options[:p]
  		#create a historgram of prefixes.
      # just need to histogram[name[0]] += 1
  	elsif options[:s]
  		#call suffix parse method from Parse.rb
      #just need to histogram[name[-1]] += 1
  	else
  		"You don't know what you're doing do you?"
      #report an error outside the analyze method?
  	end

    #output histogram to histogram.txt
    # Close all open files
  end

  desc "convert", "convert stuff and output things"
  option :i, aliases: ['--input']
  option :o, aliases: ['--output']
  option :s, aliases: ['--suffix']
  option :p, aliases: ['--prefix']

  def convert(name)
    # Get the input filename from the command line interface, and open the file for reading
    # Get the prefix and suffix histogram files from the command line interface and open them.
    # Read the histogram files to create prefix and suffix words arrays. 
    # Get the output filename from the command line interface and open a CSV file for writing
    # Write the column headers to the file
    # For each line in the incoming file,
    #   Split the line on tabs,
    #   Hand each field to the appropriate method. Use the word arrays for the name parser.
    #   collect the arrays returned from the methods
    #   output the concatenated arrays as a string to the CSV file
    # Close all open files
      "You don't know what you're doing do you?"
    end
  end
en