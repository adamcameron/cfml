# hash2array.rb

numbers = {
	:one	=> "tahi",
	:two	=> "rua",
	:three	=> "toru",
	:four	=> "wha"
}
puts numbers

arrayOfNumbers = numbers.inject([]) do |array, number|
	array.push number[1]
end

puts arrayOfNumbers