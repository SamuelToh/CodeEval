# Given a set of numbers [ 0 ... 99 ]
#  When I invoke this ruby script
#  Then all odd numbers get printed out

100.times.each do |numeric|
  puts numeric if numeric.odd?
end