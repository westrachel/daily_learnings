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
