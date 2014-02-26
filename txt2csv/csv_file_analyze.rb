require 'csv'
arr_of_arrs = []

CSV.foreach("namefile.csv") do |row|
  arr_of_arrs << row
end
