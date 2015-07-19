#
# Assumption: Input is a text file that contains numerical values on each new line
# The numerical values are expected to be >= 0
#

#
# Fibonacci mathematical equation
# F(0) = 0; F(1) = 1; F(n) = F(n-1) + F(n-2)
#
def fibonacci(n)
    return n if n <= 1
    return fibonacci(n - 1) + fibonacci(n - 2) 
end

File.open(ARGV.first).each_line do |line| 
    puts "#{fibonacci(line.to_i)}"
end