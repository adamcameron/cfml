iterations = 0
a = [5,10,5,4,6,6,5,3,3,2]
a.sort { |v1,v2|
	iterations = iterations + 1
	v1 <=> v2
}
puts '{"size": %d, "iterations": %d}' % [a.length, iterations]