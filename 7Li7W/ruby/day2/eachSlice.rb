# eachSlice.rb
numbers = [
	"tahi", "rua", "toru", "wha",
	"rima", "ono", "whitu", "waru",
	"iwa", "tekau", "tekau ma tahi", "tekau ma rua",
	"tekau ma toru", "tekau ma wha", "tekau ma rima", "tekau ma ono"
]

subset = []
numbers.each do |number|
	subset.push number
	if subset.length == 4 then
		puts subset.join ","
		subset = []
	end
end
puts
puts


numbers.each_slice(4) do |subset|
	puts subset.join ","
end