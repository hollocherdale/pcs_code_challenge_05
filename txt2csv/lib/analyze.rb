#! /usr/bin/env ruby

case ARGV[0]
  when '-p'
    regular_expression = /^\S*/
  when '-s'
    regular_expression = /\S*$/
  else
    puts "unknown option"
    puts "usage: analyze.rb -p | -s < input_file > output_file"
    exit
end

ARGV.clear

histogram = Hash.new(0)

while line = gets
  word = regular_expression.match(line).to_s
  histogram[word.to_sym] += 1
end

histogram = Hash[ histogram.sort_by { |word, count| count }.reverse]
histogram.each { |word, count| puts "#{word} #{count}" }