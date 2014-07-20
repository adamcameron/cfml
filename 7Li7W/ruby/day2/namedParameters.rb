# namedParameters.rb

def tell_the_truth(options={})
	if options[:profession] == :lawyer
		'it could be believed that this is almost certainly not false.'
	else
		true
	end
end

puts "tell_the_truth"
puts tell_the_truth
puts "\r\n\r\n"

puts "tell_the_truth :profession => :lawyer"
puts tell_the_truth :profession => :lawyer
puts "\r\n\r\n"