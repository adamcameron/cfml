# each.rb
a = []
a[0] = "a"
a[2] = "c"

a.each do |v|
	puts "value: #{(v || 'nil')}" 
end