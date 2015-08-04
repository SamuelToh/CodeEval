class Stack
  private
    @debug = false
    @top
    @stack_capacity
    @stack_array

  public
	def initialize(stack_capacity)
	  @stack_capacity = stack_capacity
	  @stack_array = Array.new(@stack_capacity)
	  @top = -1
	end
  
	def push(element)
	  puts "Pushed item = #{element}" if @debug
	  @stack_array[@top+=1] = element if (!full())
	end

	def full()
	  return @top == @stack_capacity - 1
	end

	def hasElement()
      return @top != -1 
	end

	def pop()
	  return nil if !hasElement()
      element = @stack_array[@top]
	  @stack_array.delete_at(@top)
	  @top -= 1
	  puts "Popped item = #{element}" if @debug
	  return element
	end

end

File.open(ARGV[0]).each do |line|
  test_data = line.to_s.split(" ").map{|s| s.to_i}
  myStack = Stack.new(test_data.length)

  test_data.each do |number|
    myStack.push(number)
  end

  result = ""
  for count in 0..test_data.length
    poppedNumber = myStack.pop()
    if (count.even?)
    	result << poppedNumber.to_s + " "
    end
  end
  puts result
end