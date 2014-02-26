require 'spec_helper'

# First, define methods used to create the test files.
# We create the test files here
#   1) so that the test can be run on its own and
#   2) so the contents of the file are clear

def analyze_create_test_file (filename)
  File.open(filename, "w") do |f|
    5.times  {f.puts "Mrs. Theresa E. Stamm\t1-678-523-6736\tReinger\tkieran@runte.biz"}
    6.times  {f.puts "Keara Maggio\t1-399-471-4388 x9581\t@weber\tcayla@lubowitz.com"}
    4.times  {f.puts "Daren S. Padberg DVM\t240-399-5583 x73790\tHessel\taugusta@stoltenberg.com"}
    10.times {f.puts "Claud Auer\t(561)024-9548 x165\t@Mraz\tjettie_friesen@weber.com"}
    7.times  {f.puts "Mrs. Sam Parisian\t818-657-9309 x5633\t@Quigley\tlavon.quitzon@schinnercain.biz"}
    2.times  {f.puts "Ciara X. Windler II\t575-225-1469 x240\tLabadie\tryan_moore@hagenesmiller.com"}
    3.times  {f.puts "Davion G. Streich\t333-783-4674 x18711\tSchneider\tole.bashirian@murazikmonahan.org"}
 end
end

def analyze_create_prefix_expected_file (filename)
  # Note sort order - by count, not by word
  File.open(filename, "w") do |f|
    f.puts "Mrs. 12"
    f.puts "Claud 10"
    f.puts "Keara 6"
    f.puts "Daren 4"
    f.puts "Davion 3"
    f.puts "Ciara 2"
  end
end

def analyze_create_suffix_expected_file (filename)
  File.open(filename, "w") do |f|
    f.puts "Auer 10"
    f.puts "Parisian 7"
    f.puts "Maggio 6"
    f.puts "Stamm 5"
    f.puts "DVM 4"
    f.puts "Streich 3"
    f.puts "II 2"
  end
end

describe "analyze" do

  # Set up the files need for the specifications
  # put them down in the spec folder so they don't clutter the project root folder

  before(:all) do
    analyze_create_test_file 'spec/testfile.txt'
    analyze_create_prefix_expected_file 'spec/expected_prefixes.txt'
    analyze_create_suffix_expected_file 'spec/expected_suffixes.txt'
  end

  # clean up after ourselves

  after(:all) do
    File.delete 'spec/testfile.txt'
    File.delete 'spec/expected_prefixes.txt'
    File.delete 'spec/expected_suffixes.txt'
    File.delete 'spec/prefix_histogram.txt'
    File.delete 'spec/suffix_histogram.txt'
  end

  # specify what the options and STDIN and STDOUT are supposed to do

  it "it runs thor analyze method and creates a histogram of prefixes" do
    `bin/txt2csv analyze -i spec/testfile.txt -o spec/prefix_histogram.txt -p`
    IO.read('spec/prefix_histogram.txt').should == IO.read('spec/expected_prefixes.txt')
  end

  it "it runs thor analyze method and creates a histogram of suffixes" do
    `bin/txt2csv analyze -i spec/testfile.txt -o spec/suffix_histogram.txt -s`
    IO.read('spec/suffix_histogram.txt').should == IO.read('spec/expected_suffixes.txt')
  end
end