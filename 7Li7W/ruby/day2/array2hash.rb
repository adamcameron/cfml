# array2hash.rb
numbers = ["tahi", "rua", "toru", "wha"]

hash = {};
numbers.each_with_index do |number, index|
	hash[index+1] = number
end

puts hash