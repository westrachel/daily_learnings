# Practice using common methods:


# 1. Add "Success consists of going from failure to failure" to the front of:
quote = "without loss of enthusiasm."

# string concatenation:
"Success consists of going from failure to failure" + quote

# conversion to an array (String#prepend would simplify by removing the need to convert to an array)
quote.split(' ').unshift("Success consists of going from failure to failure").join(' ')


# 2. Working with hashes:
# 2i. select all key value pairs that start w/ B
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.select do |k, v|
  k[0] == "B"
end
# => {"Barney"=>2, "Betty"=>3, "BamBam"=>4} 

# Precise language practice:
# The select method is invoked above with a block on the flinstones hash. On each iteration, one string key and integer value pair of the flintstones hash
# is passed to the local variables k, v. Within the block, the slice method is called is called on the local variable k and the element at the
#  zeroth index of the string value that the local variable k points to is tested for equivalence to the string "B". If the zeroth indexed element is equal to
#  "B" than the block's return value for the current iteration is true. The select method evaluates the block's return value on each iteration and if the block's
#   return value is true, then the key/value pair are selected from the hash included in the new hash return value of the select method invocation with a block.

flintstones.map do |k, v|
  if k[0] == "B"
    [k, v]
  else
    0
  end
end.select {|x| x != 0 }
# => [["Barney", 2], ["Betty", 3], ["BamBam", 4]] 

# 2ii.Check if "Spot" is a key
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.keys.include?("Spot")
# => false
flintstones.has_key?("Spot")
# => false
flintstones.map do |k, v|
  k == "Spot"
end.all? {|boolean| boolean == false}
# => true

# 3. Working with arrays:
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# output:
# 1
# 2

# return value of each method call is the object that it was originally called on:
# => [1, 2] 

# Code Explanation:
# The each method is invoked with a block on the numbers array. On the first iteration, the local variable number gets assigned to
#  the integer value 1. Then the p method is called on the number variable, which will display the value 1. Subsequently, the pop
#  mutating method is called on the numbers array with the argument 1 passed into the pop method call. The pop method call removes
#  the last element from the array the number variable points to and is destructive, which means that the array the numbers variable
#  points to subsequently contains only 3 elements. On the second iteration, the local variable number gets assigned to the integer
#  value 2. Then the p method is called on the number variable, which will display the value 2. Subsequently, the pop mutating method is
#  called on the numbers array with the argument 1 passed into the pop method call. The pop method call destructively removes the current
#  last element from the array the number variable points to, which is the integer value 3. At this point, there are only 2 elements left
#  in the array that the number variable points to, the integer value 1 and the integer value 2. Since there are no more elements left
#  to iterate over the iterative process stops and the overall return value of the each method invocation with a block is the array that
#  numbers local variable points to, which has been mutated to be: [1, 2]

# p method:
#   > outputs the value of calling inspect on the object that the p method was called on
#   > returns the object

# inspect method:
#   > returns the string value of the object that the inspect method is called on
