# 4.coffee

# video

# ranges
range = [1..4]

range = [1...4]

start = 5
end = 10
range = [start..end]
range[1..4]
range[1...range.length]
range[1..-1]

storeLocations = [
	"Auckland"
	"Wellington"
	"Dunedin"
]

storeLocations.forEach (location, index) ->
	alert "Location: #{location}"


for location in storeLocations
	alert "Location: #{location}"

# list comprehensions

alert "Location: #{location}" for location in storeLocations


"#{loc}, NZ" for loc in storeLocations


storeLocations = ("#{loc}, NZ" for loc in storeLocations)


geoLocate(loc) for loc in storeLocations when loc isnt "Dunedin"

storeLocations = ("#{loc}, NZ" for loc in storeLocations when loc isnt "Dunedin")


newLocs =  (loc for loc in storeLocations when loc isnt "Dunedin")

# splats
searchLocations = (brand, cities, ...) ->
	"looking for #{brand} in #{cities.join(',')}"

params = ["Starducks", "Orlando", "Winter Park"]
searchLocations(params)


# objects

coffee = {name:"French",strength: 1}
coffee = name:"French",strength: 1
coffee =
	name		: "French"
	strength	: 1
	brew		: -> alert "brewing #{@name}" 
	pour		: (amount=1) ->
		if amount is 1
			"poured a single cup"
		else
			"Poured #{amount} cups"


coffees = 
	french	:
		strength	: 1
		in_stock	: 20
	italian	:
		strength	: 2
		in_stock	: 12
	decaf	:
		strength	: 0
		in_stock	: 8


"#{coffee} has #{attrs.in_stock}" for coffee, attrs of coffees

for coffee, attrs of coffees
	"#{coffee} has #{attrs.in_stock}"

to_print = for coffee, attrs of coffees when attrs.in_stock > 0
	"#{coffee} has #{attrs.in_stock}"
to_print.join ", "


# 4.1
range = [1..10]

# 4.2
range = [1...11]

# 4.3
coffee = 
	name		: "Russian"
	level		: 2
	isRussian	: -> true

# 4.4
for person in people when person.age > 18
	console.log person.name

# 4.5

for person in people
  console.log(person.name) if person.age > 18


console.log person.name for person in people when person.age > 18


# 4.6

for coffee in coffeeList
  if not coffee.isRussian?()
    addCoffee(coffee)

addCoffee coffee for coffee in coffeeList when not coffee.isRussian?


# 4.7
displayTopPicks = (bestCoffee, suggested) ->
  alert('Top #1 ' + bestCoffee)
  alert('Suggested: ' + suggested)

displayTopPicks = (bestCoffee, suggested...) ->
  alert('Top #1 ' + bestCoffee)
  alert('Suggested: ' + suggested.join(", "))























