# Reassignment Concepts:

# 1. Variables cannot be reassigned within a method invocation, but can be reassigned within a block
#    that's passed as an argument to a method invocation with a block.

# 2. Reassignment is not mutating.

# => Illustrating Example:
a = 'apple'
puts a.object_id
# side effect = output: 5658920
# return value: nil

def snack(fruit)
  fruit = 'banana'
end

snack(a) 
# The local variable a is passed in as an argument to the snack method invocation.
# The parameter fruit initially points to the same string that the local variable a points to.
# The local variable fruit is reassigned and made to point to the string whose value is 'banana'.
# Reassignment changes the physical address space that the fruit variable points to, so that fruit
# and the local variable a no longer point to the same string. The variable a still points to the string 'apple'.
puts a
# side effect = output: 'apple'
# return value: nil
puts a.object_id
# side effect = output: 5658920
# return value: nil

loop do # loop method invocation w/ a block
  # this comment falls within the block, which is delimited by do...end and is officially a block b/c this
  # do...end immediately follows a method invocation, specifically, the loop method.
  a = 'banana' # local variable a is reassigned to point to the string whose value is 'banana'
  # <=> inner scope (initialized by the method invocation w/ a block) has access to outer scope, which is
  #  why the local variable a can be referenced w/in this block.
  break # prevent infinite looping w/ use of break keywrod
end

puts a
# side effect = output: 'banana'
# return value = nil
puts a.object_id
# side effect = output: 5658640 
# <=> local variable a points to a different string, 'banana', which has a different object_id than the string 'apple'
# return value = nil

# 3. Variable shadowing: a variable within an inner scope has the same name as outer scope variable and prevents
#     the variable in the outer scope from being accessed and potentially mutated within the inner scope.
# => Illustrating Example:
label = 'elements'

arr = ['earth', 'air', 'fire', 'water']

arr.each do |label|
  puts label
  label = label.upcase
  puts label 
end
# side effect = output:
# => earth
# => EARTH
# => air
# => AIR
# => fire
# => FIRE
# => water
# => WATER

puts label
# side effect = output: 'elements'

# Example notes:
# The each method is invoked with a block and called on the variable arr, which
#  points to an array. Each element of the array that arr points to is passed into the block
#  and assigned to the local variable label. Within the block, during each iteration, the
#  the local variable label is passed in as an argument to the puts method invocation. Subsequently,
#  the local variable label is reassigned to the return value of calling the upcase method on the local
#  variable label. After, the reassigned label variable is passed in as an argument to the puts method
#  invocation.

# The local variable label initialized in the outer scope is not referenced within the inner scope
# due to variable shadowing and is therefore not reassigned w/in the block of the each method invocation with
# a block.
