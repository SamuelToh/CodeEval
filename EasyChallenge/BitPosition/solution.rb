# Given a number n and two integers p1,p2
# determine if the bits in position p1 and p2 are the same or not. 
# Positions p1 and p2 are 1 based.
#
# The first argument will be a path to a filename 
# containing a comma separated list of 3 integers, one list per line
# Print to stdout, 'true'(lowercase) if the bits are the same,
# else 'false'(lowercase). 

File.open(ARGV[0]).each do |line|
  value, binPositionX, binPositionY = line.split(",").map{|str| str.to_i}
  
  # Shift right until the code could reach the bit of interest.
  # Perform an AND operator to test and see if the bit is 1 or 0
  bitX = (value >> binPositionX - 1) & 1
  bitY = (value >> binPositionY - 1) & 1

  puts bitX == bitY
end