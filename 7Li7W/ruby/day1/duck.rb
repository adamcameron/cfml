#duck.rb
puts i = 0
puts a = ['100', 100.0]
puts "========"

while i < 2
	puts a[i].to_i
	i = i + 1
end
puts "========"

['100', 100.0].each {|value|
	puts value.to_i
}
puts "========"

begin
	puts '100' + 100.0
rescue
	puts "puts '100' + 100.0 won't work" # so don't agree that was an example of duck-typing
end