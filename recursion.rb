# Recursion methods call themselves essentially iterating backwards to some baseline case. Once the 
#   baseline case result is returned the recursion method works back to return all values necessary
#   to evaluate the initial method call.

# Problem: create a method that accepts a positive integer n and returns the product of all positive integers
#    leading up to, and including, the positive integer n.

# Examples:
# factorial(4) == 4 * 3 * 2 * 1 == 24
# factorial(4) == n * (n-1) * (n-2) * (n-3)
#    <=> (n-3) is essentially 1, if had called factorial(5) instead, would've needed to call n * (n-1) * (n-2) * (n-3) * (n-4)
#    <=> so, smallest factor for both factorial(5) and factorial(4) is the same, it's 1, but the number of factors being called is
#        dependent on the size of n
#    <=> however, can rewrite factorial(n) == n! == n * (n-1)!
# factorial(4) == 4 * (4-1)! == 4 * 3!
#    >> call factorial method internally on 3 to derive value of 3!: factorial(3) == 3 * (3-1)! == 3 * 2!
#    >> call factorial method internally on 2 to derive value of 2!: factorial(2) == 2 * (2-1)! = 2 * 1!
#    >> 1! should be base case, since 1 is the smallest factor that should be included in the product calculation of the factorial multiplication

# Data:
# Input:
#   > a positive integer
# Output:
#   > a positive integer that is the product of all positive integers between 1 and the inputted integer, 
#      including the inputted integer

# Algorithm:
# 1. If the inputted number is 1, then return 1
# 2. Otherwise, return the product of the passed in integer, n, times the factorial method called on the value of the
#    passed in integer minus 1, (n-1)

# Code:
def factorial(n)
  if n == 1
    1
  else
    n * factorial(n - 1)
  end
end

# check work:
p factorial(9) == 362880
# => true
p factorial(4) == 24
# => true