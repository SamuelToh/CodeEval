class Node
  public
    attr_accessor :next
    attr_accessor :number

    def initialize(number)
      @number = number
    end
end

@nodeDir = Hash.new

# Main
File.open(ARGV[0]).each do |line|
  prev, curr = nil
  found_cyclic, end_cyclic = false
  cyclic_array = Array.new
  @numbers = line.split(' ').map{|number| number.to_i}

  @numbers.each do |number|
    # Cyclic detection algorithm
    if (found_cyclic && end_cyclic)
      break
    elsif (found_cyclic) 
      curr = @nodeDir[number]
      if (prev.next == nil)
      	end_cyclic = true
      else(prev.next.number == number)
      	# Still in a cyclic
        cyclic_array.push(number)
      end
    else
      if (@nodeDir.has_key?(number))
        found_cyclic = true
        cyclic_array.push(number)
        curr = @nodeDir[number]
      else
        @nodeDir[number] = curr = Node.new(number)
        prev.next = curr if prev != nil      
      end
    end
    prev = curr
  end

  puts "#{cyclic_array.join(' ')}"
  @nodeDir.clear
end