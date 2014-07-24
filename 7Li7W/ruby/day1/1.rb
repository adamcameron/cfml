 # 1.rb

properties = [ 'object oriented' , 'duck typed' , 'productive' , 'fun' ]
properties.each {|property| puts "Ruby is #{property}." }

puts;

properties.each do |property|
	 puts "Ruby is #{property}."
end