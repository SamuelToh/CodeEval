# The last bit of an odd number always ends with 1.
# E.g. number 3 has a binary of 101 and number 9 1001. While 8 has 1000 and 2 is 10

def evenNumber(number)
  # AND the last bit, resultant are 
  # Odd is 1 and even is 0
  # Then XOR the result so that it returns 1 for even and 0 for odd
  return (number & 1) ^ 1 
end

## Main
File.open(ARGV[0]).each do |line|
  puts "#{evenNumber(line.to_i)}"
end