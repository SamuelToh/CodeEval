
# Main
File.open(ARGV[0]).each do |line|
	decoded = ""
    value, key = line.split('|')
    keys = key.split(' ').map{|number| number.to_i}

    keys.each do | position | 
        decoded << value[position - 1].to_s
    end
    puts decoded
end