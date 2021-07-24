# Practie workig with collections (strings/arrays/hashes)--

# Problem Part 1:
# create a method that accepts one string argument and returns a boolean (T/F) indicating if the string is a palindrome or not w/o using reverse method

# Examples:
#palindrome?("madam") == true
#palindrome?("nurses run") == false
#palindrome?("hello") == false

# Data:
# input: string (can have characters, spaces)
#   <=> additional requirements: it is case sensitive, so madam != Madam
# output: boolean (true or false)

# Algorithm:
#   Initialize an empty hash
#   Split the inputted string into characters
#   Iterate through the characters and assign each as a value associated with its index position in the inputted string as its key
#       and push each key/value pair created to the hash
#   Initialize an empty string
#   Push to the hash each character based on the associated key, and push them in reverse order
#       <=> so, I want to push the value character associated with the highest index key to the empty string first
#        > the highest key is going to be the largest index of the inputted string, which is equivalent to the string's size minus 1
#   Check if the reversed string is equivalent to the inputted string
#      <=> when checking for equivalence, have this be the last line of the created method so that the boolean is the
#          return value of the method

# Code:
# realized using a hash is unnecessary b/c can just prepend
def palindrome?(string)
  reversed = ""
  string.chars.each do |char|
    reversed.prepend(char)
  end
  reversed == string
end

p palindrome?("madam") == true
# => true
p palindrome?("nurses run") == false
# => true
p palindrome?("hello") == false
# => true

# Problem Part 2:
# Update palindrome method so that case sensitivity and spaces don't matter:

# Examples:
#p palindrome?("Was it a car or a cat I saw?") == true
#p palindrome?("nurses run") == true

# Algorithm:
# <=> updates required to previous palindrome method to work for the above test cases:
#    > downcase all characters in the inputted string when push to the reversed string 
#    > downcase the inputted string before comparing it to the reversed string
#    > remove space characters from the inputted string before pushing characters to the reversed string and
#           when comparing againsted the reversed string
#    > also, need to modify the method to not consider punctuation

# Code:
EXCLUDE = [" ", "?", ".", "!", ","]
def palindrome?(string)
  mutated_string_chars = string.downcase.chars.select do |char|
    EXCLUDE.include?(char) == false
  end
  reversed = ""
  mutated_string_chars.each do |char|
    reversed.prepend(char)
  end
  reversed == mutated_string_chars.join('')
end

p palindrome?("Was it a car or a cat I saw?") == true
# => true
p palindrome?("nurses run") == true
# => true

# Problem Part 3:
# Select a character out of a string if its index is a fibonacci number

# Fibonacci sequence
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233...

# Fibonacci sequence (segment of interest)
#  1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233...

# Data:
#  Input: a string
#  Output: assuming return all characters (in a hash) with each key corresponding with the index/fibonacci number that describes
#      the index location of the key's corresponding character's index position in the inputted string

# Algorithm:
#  > calculate the max index of the inputted string, which would be at most the largest fibonacci number to find (largest
#       index could also not be a fibonacci number)
#  > initialize an empty array
#  > initialize a variable, position, that initially points to 1
#  > write a sub-method to calculate the nth number in the fibonacci sequence
#        input: a number n
#        output: all the fibonacci numbers less than or equal to max index
#  > start a loop method, and until the fibonacci method invocation with the integer that the position variable points to
#      passed in as an arguement returns a number greater than the max index, keep iterating
#      > during each iteration call the fibonacci method and pass in the position variable as an argument
#      > check if the returned fibonacci integer is less than or equal to the max index of the inputted string
#      > if the returned fibonacci integer is an index in the inputted string (as checked by the previous step), then push the integer
#          to the array (initialized previously)
#      > break out of the loop
#  > iterate through the string and push all characters whose index is present in the array of fibonacci numbers created previously
#      as values to a hash with the corresponding key being equivalent to the character's fibonacci number index position in the inputted string
#  > return the hash

# Fibonacci method definition:
#   > use recursion (have the method call itself until it reaches a base case)

def fibonacci(n)
  if n <= 2
    1
  else
   fibonacci(n - 1) + fibonacci(n - 2)
  end
end
p fibonacci(1)
# => 1
p fibonacci(2)
# => 1
p fibonacci(5)
# => 5
p fibonacci(6)
# => 8
p fibonacci(7)
# => 13

def fibonacci_idx_chars(str)
  fib_indexes = []
  position = 1
  until fibonacci(position) > (str.size - 1)
    fib_indexes << fibonacci(position) if fibonacci(position) < str.size
    position += 1
  end
  fib_indexes.each_with_object({}) do |index, hash|
      hash[index] = str[index]
  end
end

# check work:
p fibonacci_idx_chars("hello") == { 1 => "e", 2 => "l", 3 => "l"}
# => true
p fibonacci_idx_chars("nurses run") == { 1 => "u", 2 => "r", 3 => "s",
                                         5 => "s", 8 => "u"}
# => true
