# Problem:
# Create a method that accepts one string argument and returns a string where all the original characters
#     are in reversed order (without using the built in reverse method)

# Examples:
# reversed("Less is more") == "erom si sseL"
# reversed("  ") == "  "

# Data:
# Input: a string
# Output: a string w/ all the elements reversed

# Algorithm:
# 1. Split the string into characters
# 2. Iterate through all the characters and push each character to a hash as a value where the key is an integer incrementing upwards from zero
#      and each value corresponds with a character
#   For ex: ["h", "e", "l", "l", "o"]
#      when iterating, the "h" character is the first character and should get assigned to the hash first and its key should be zero
#        on the second iteration, the "e" is the second character string and should get assigned to the hash second and its key should be 1
# 3. Iterate through the hash and sort the hash by its keys in descending order, so that the largest integer value key is the first key
#       in the sorted hash
# 4. Select only the values from the sorted hash
# 5. Join the selected values together into one string and make this sorted string that's a reversed version of the inputted string
#       be the return value of the overall method

# Code:
def reversed(str)
  index = 0
  hsh = str.chars.each_with_object({}) do |char, hsh|
    hsh[index] = char
    index += 1
  end
  descending_arr = hsh.sort do |idx1, idx2|
    idx2 <=> idx1
  end.flatten.select {|x| x.is_a?(String) }
  descending_arr.join("")
end

# check work:
puts reversed("Less is more") == "erom si sseL"
# => true
puts reversed("  ") == "  "
# => true
