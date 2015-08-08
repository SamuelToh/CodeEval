# Problem definition:
# -------------------
# Given a string of characters
#   And a second set of characters was supplied
#  When I am try to match the second set of characters to the original set for substring
#  Then the script reports true if substring exists 
#   And false otherwise.
#
# ** Im trying to avoid using regular expression!!
#   
#
# Algorithm explaination
# Each character is treated as a node
# The program will parse the entire string into a set of 
# and these nodes are linked together forming a graph
# 
# Then a hash with key value pair of key=char and value=array of nodes
# is created for efficient lookup purpose.
# 
# The first char of the 2nd set is then used in the hash map to look up for
# a possible starting node. From there the algorithm tries to match the subsequent
# characters one by one, if a full match is found then it breaks and return true
# else it tries for another node in the hash, if there is one.
#
# If there is nothing left then it reutrns false. 
require 'pp'

class CharacterNode
  public
    attr_accessor :character
    attr_accessor :nextNode

    def initialize(character)
      @character = character
    end

    def hasNextNode
      return @nextNode != nil
    end
end


@charNodeCache = Hash.new

def PopulateCharNodes(line)
  prevNode = nil
  line.split("").each do |char|
    @charNodeCache[char] = Array.new if (not @charNodeCache.has_key?(char))
    charNode = CharacterNode.new(char)
    prevNode.nextNode = charNode if (not prevNode == nil)
    @charNodeCache[char].push(charNode);
    prevNode = charNode
  end
end

def GetPossibleStartNodes(substring)
  return @charNodeCache[substring[0]] if substring.length > 0
end

def SearchString(possibleStarts, substringVal)
  hasSubString = false
  asterisk = false
  escaped = false

  possibleStarts.each do |node|
  	break if hasSubString

    currCharNode = node
    substringVal.split("").each_with_index do |char, index|
      # For asterisk - literate until a char node matches the next char
      escaped = true and next if char == "\\"
      asterisk = true and next if char == "*" and escaped == false
      if asterisk
      	foundNextNode = false
        loop do 
          if currCharNode.character == char
            foundNextNode = true
            asterisk = false
            # Iterate to the next node so the next loop can try continue to match 
            break if !currCharNode.hasNextNode
            currCharNode = currCharNode.nextNode if currCharNode.hasNextNode
            break
          end
          # Do until a matching character is found
          break if !currCharNode.hasNextNode
          currCharNode = currCharNode.nextNode if currCharNode.hasNextNode
        end
        next if foundNextNode
      elsif escaped
      	escaped = false

      end

  	  if index != 0
        if char != currCharNode.character
          break # Mismatch
        end
        if (index == (substringVal.length-1))
          hasSubString = true # Last character has been matched.
        end
      end
      break if !currCharNode.hasNextNode # Still has char to match but the main string already has no more
      currCharNode = currCharNode.nextNode if currCharNode.hasNextNode
    end
  end

  return hasSubString
end


# Main
File.open(ARGV[0]).each do |line|
  originalValue, substringVal = line.chomp.split(',')
  #puts "Original value = #{originalValue} || substringVal = #{substringVal}"
  PopulateCharNodes(originalValue)
  startNodes = GetPossibleStartNodes(substringVal)

  hasSubString = false;
  if (startNodes != nil && startNodes.count > 0)
    hasSubString = SearchString(startNodes, substringVal)
  end

  puts hasSubString
  @charNodeCache.clear()
end