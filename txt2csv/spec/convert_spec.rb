require 'spec_helper'
require 'csv'

# First, define methods used to create the test files.
# We create the test files here
#   1) so that the test can be run on its own and
#   2) so the contents of the file are clear

def convert_create_test_file (filename)
  File.open(filename, "w") do |f|
    f.puts "Mrs. Theresa E. Stamm\t1-678-523-6736\tReinger\tkieran@runte.biz"
    f.puts "Keara Maggio\t1-399-471-4388 x9581\t@weber\tcayla@lubowitz.com"
    f.puts "Daren S. Padberg DVM\t240-399-5583 x73790\tHessel\taugusta@stoltenberg.com"
    f.puts "Claud Auer\t(561)024-9548 x165\t@Mraz\tjettie_friesen@weber.com"
    f.puts "Mrs. Sam Parisian\t818-657-9309 x5633\t@Quigley\tlavon.quitzon@schinnercain.biz"
    f.puts "Ciara X. Windler II\t575-225-1469 x240\tLabadie\tryan_moore@hagenesmiller.com"
    f.puts "Davion G. Streich\t333-783-4674 x18711\tSchneider\tole.bashirian@murazikmonahan.org"
 end
end

def convert_create_prefix_expected_file (filename)
  # Note sort order - by count, not by word
  File.open(filename, "w") do |f|
    f.puts "Mrs. 12"
  end
end

def convert_create_suffix_expected_file (filename)
  File.open(filename, "w") do |f|
    f.puts "DVM 4"
    f.puts "II 2"
  end
end

def create_expected_csv_file (filename)
  CSV.open(filename, "w", :write_headers => true, :headers => ["Prefix","First Name","Middle Name", "Last Name", "Suffix", "Country Code", "Area Code", "Prefix", "Line", "Extension", "Twitter", "Email"]) do |csv|
    csv << ['Mrs.','Theresa','E.','Stamm',"",'1','678','523','6736',"",'Reinger','kieran@runte.biz']
    csv << ["",'Keara',"",'Maggio',"",'1','399','471','4388','9581','weber','cayla@lubowitz.com']
    csv << ["",'Daren','S.','Padberg','DVM',"",'240','399','5583','73790','Hessel','augusta@stoltenberg.com']
    csv << ["",'Claud',"",'Auer',"","",'561','024','9548','165','Mraz','jettie_friesen@weber.com']
    csv << ['Mrs.','Sam',"",'Parisian',"","",'818','657','9309','5633','Quigley','lavon.quitzon@schinnercain.biz']
    csv << ["",'Ciara','X.','Windler','II',"",'575','225','1469','240','Labadie','ryan_moore@hagenesmiller.com']
    csv << ["",'Davion','G.','Streich',"","",'333','783','4674','18711','Schneider','ole.bashirian@murazikmonahan.org']
  end
end

describe "analyze" do

  # Set up the files need for the specifications
  # put them down in the spec folder so they don't clutter the project root folder

  before(:all) do
    convert_create_test_file 'spec/testfile.txt'
    convert_create_prefix_expected_file 'spec/pared_prefixes.txt'
    convert_create_suffix_expected_file 'spec/pared_suffixes.txt'
    create_expected_csv_file 'spec/expected_namefile.csv'
  end

  # clean up after ourselves

  after(:all) do
    File.delete 'spec/testfile.txt'
    File.delete 'spec/pared_prefixes.txt'
    File.delete 'spec/pared_suffixes.txt'
    File.delete 'spec/namefile.csv'
    File.delete 'spec/expected_namefile.csv'
  end

  # specify what the options and STDIN and STDOUT are supposed to do

  it "it runs thor convert method and creates a CSV of test customer data" do
    `bin/txt2csv convert -p spec/pared_prefixes.txt -s spec/pared_suffixes.txt -i spec/testfile.txt -o spec/namefile.csv`
    CSV.read('spec/namefile.csv').should == CSV.read('spec/expected_namefile.csv')
  end
end