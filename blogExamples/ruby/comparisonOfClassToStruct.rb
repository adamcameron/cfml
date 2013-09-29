class PersonViaClass
	attr_accessor :firstName, :lastName

	def initialize(firstName, lastName)
		@firstName, @lastName = firstName, lastName
	end
end

PersonViaStruct = Struct.new(:firstName, :lastName)


son = PersonViaClass.new("Zachary", "Cameron Lynch")
puts son.firstName

dad = PersonViaStruct.new("Adam", "Cameron")
puts dad.lastName