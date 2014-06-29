# 1.coffee

# 1.1
person = "Zachary"

# 1.2
greet = ->
	alert "Hello CoffeeScript"

# 1.3
greet = (v) ->
	alert v

# 1.4
greet = (message, message2) ->
	alert message + " " + message2

# 1.5
greet = (name="Stranger") ->
	alert name

# 1.6
greet = (name='Stranger') ->
	"Hello, #{name}"


# 1.7
sum = (x,y) ->
	x+y