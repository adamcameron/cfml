iterations = 0
a = [2,1,4,3,6,5,8,7]
a.sort { |v1,v2|
	iterations = iterations + 1
	v1 <=> v2
}
puts '{"size": %d, "iterations": %d}' % [a.length, iterations]