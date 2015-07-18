#
# Assumption: The first line is always an integer value and it is non zero.
#
@debug=false

#
# The challenge_line algorithm takes in a parameter called line.
# It uses the line param to challenge other lines in the @longest_line_arr array.
#
# If the challenging line is longer than 1 of the stored values in the array, 
# then the winner gets a slot in the array and the loser value will get shifted
# an array position, the element in the last position is discarded. 
#
def challenge_lines(line, defenderIndex = 0)
    return if (defenderIndex >= @longest_line_arr.length)

    defender = @longest_line_arr[defenderIndex];
    puts "ChallengerLine = #{line}, " \
         "Defender = #{defender}, index= #{defenderIndex}" if @debug
    
    if (line.length > defender.length)
        puts "Challenge victory!" if @debug
        @longest_line_arr[defenderIndex] = line
        challenge_lines(defender, defenderIndex + 1)
    end
end

File.open(ARGV[0]).each_with_index do |line, index|
    if index == 0
    	@num_output = line.to_i
        return if (@num_output == 0)

    	@longest_line_arr = Array.new(@num_output, "");
    else
        challenge_lines(line.chomp);
    end
end

puts @longest_line_arr