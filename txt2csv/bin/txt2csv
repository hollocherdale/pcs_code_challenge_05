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

  File.readlines(options[:i]) do |line|
    line_array = line.split("\t")
    name = line_array.shift
    analyze(name)
  end

  def analyze(name)
  	if options[:p]
  		#call prefix parse method from Parse.rb
  	elsif options[:s]
  		#call suffix parse method from Parse.rb
  	else
  		"You don't know what you're doing do you?"
  	end

  end
end