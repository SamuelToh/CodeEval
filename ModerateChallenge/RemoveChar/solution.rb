# Given a path to a file. 
#   And the file contains a source string and the characters that need to be scrubbed.
#   And the source string and the to-be-removed characters are delimited by a comma.
#  When I passed the file to my ruby script
#  Then the to-be-removed chars are removed from the source string 


#
# Main
#
File.open(ARGV[0]).each do |line|
  value, charsToRemove = line.split(',')
  charsToRemove = charsToRemove.lstrip
  puts value.gsub(/[#{charsToRemove}]/, "").rstrip
end