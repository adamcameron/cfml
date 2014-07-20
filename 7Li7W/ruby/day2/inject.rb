# inject.rb

a = [5,3,4,1]
puts a
puts;puts;

puts a.inject(0) {|sum, i| sum + i}
puts;puts;

puts a.inject {|sum, i| sum + i}
puts;puts;

puts a.inject {|product, i| product * i}
puts;puts;

a.inject(0) do |sum, i|
	puts "sum: #{sum} i: #{i} sum + i: #{sum + i}"
	sum + i
end