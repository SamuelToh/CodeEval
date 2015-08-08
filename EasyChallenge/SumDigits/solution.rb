# Problem Description:
# Given a positive integer, find the sum of its constituent digits.

File.open(ARGV[0]).each do |line, index|
  sum = 0
  line.split("").each { |number| sum += number.to_i }
  puts sum
end