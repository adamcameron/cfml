numbers = ["one","two","three","four"]
numbers.each_with_index { |value,index|
	if value=="one" then
		numbers.concat ["five"] 
	end

	puts "Index: %d; value: %s" % [index+1,value]
}