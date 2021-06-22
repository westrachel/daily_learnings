# Breaking down the Enumerable#sort method ruby documentation:

# sort --> array
# sort { |a,b| block } --> array

# Takeaways:
#   i. the return value of #sort is an array containing the sorted elements of the object that the sort method is invoked on
#   ii. the sort method accpets a block as an argument, so if it is invoked with a block, it will execute the block

# "Comparisons for the sort will be done using the items’ own <=> operator or using an optional code block. The block must
#   implement a comparison between a and b and return an integer less than 0 when b follows a, 0 when a and b are equivalent,
#   or an integer greater than 0 when a follows b."

# Takeaways:
#  > The sort method uses the return value of the <=> operator to determine how to sort elements. The <=> method returns the integer
#     values of -1, 0, or 1 as long as the elements being compared are actually comparable.
#       irb:
#       100 <=> -30
#       => 1
#       -30 <=> 100
#       => -1
#       100 <=> 100
#       => 0
#       "abc" <=> 100
#       => nil
#       conclusions from above: 1 is returned if the first element is larger than the second, 0 is returned if the 2 elements
#            being compared are the same, and -1 is returned if the first element is smaller than the second. Finally, nil is
#            returned if the two elements aren't comparable.
#
#  > "comparisons for the sort will be done using hte items' owwn <=> operator"; so, objects in a collection that the sort method is
#    invoked on must have a <=> method to be able to sort the elements. Strings, arrays and symbols all have <=> methods. However,
#    symbols are technically converted to stirngs before calling the <=> method, so the string#<=> method is really at play.

a = [100, -30, 4, 76]

p a.sort
# => [-30, 4, 76, 100]
# 

a[0] = "abc"

#p a.sort
# => ArgumentError: comparison of String with -30 failed

# Can strings and integers be present in the same collection collection that has the sort method invoked on it without returning
#   an error?
p [["bcd", 5], ["abc"], ["Abc", 10], ["dcb", 1]].sort
# =>[["Abc", 10], ["abc"], ["bcd", 5], ["dcb", 1]]

#   notes:
#     > only the first element of the sub-arrays are used to compare and sort the sub-arrays
#     > sorting strings is based on the ASCII table, where capitalized letters come before lowercased letters
#          'A' <=> 'a'
#           => -1

p [["bcd", 5], ["abc", 4], ["Abc", 10], ["dcb", 1]].sort
# => [["Abc", 10], ["abc", 4], ["bcd", 5], ["dcb", 1]]
# <=> above example confirms that even if all sub-arrays have 2 elements, still only the 1st element is being used
#    to compare the sub-arrays and order them