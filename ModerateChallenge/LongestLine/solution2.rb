#
# Assumption: The first line is always an integer value and it is non zero.
#
@debug=false

#
# This is a more efficient approach than the first proposed solution
# Read in the file content into an array and then sort them by descending order
# After which, print the top X lines into standard out  
#
file = File.open(ARGV.first)
@num_outputs = file.readline.to_i

@lines_array = Array.new
file.each do |line|
    @lines_array.push(line.chomp)
end

@lines_array.sort! { |x,y| y.length <=> x.length }
puts "Sorted array content= #{@lines_array}" if @debug

puts @lines_array.first(@num_outputs)