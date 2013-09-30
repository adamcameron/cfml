# struct.rb
def sep
	puts "=" * 20
end

Name = Struct.new(:first, :last)

son = Name.new("Zachary", "Cameron Lynch")
puts son.first
puts son.last
sep
puts son.length
son.each do |k|
	puts k
end
sep

