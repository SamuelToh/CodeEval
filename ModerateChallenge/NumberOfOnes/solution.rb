## Main
File.open(ARGV[0]).each do |line|
  puts line.to_i.to_s(2).count('1')
end