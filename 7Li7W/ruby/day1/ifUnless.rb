#ifUnless.rb
x = 4

puts 'This appears to be false.' unless x == 4
puts 'This appears to be true.' if x == 4

if x == 4
	puts 'This appears to be true.'
end

unless x == 4
	puts 'This appears to be false.'
else
	puts 'This appears to be true.'
end

puts 'This appears to be true.' if not true
puts 'This appears to be true.' if !true