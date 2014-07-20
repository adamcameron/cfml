#typing.rb
begin
	puts 4 + 'four'
rescue
	puts "4 + 'four' failed"
end
puts 4.class
puts (4.0).class
puts 4 + 4.0
puts (4 + 4.0).to_i
