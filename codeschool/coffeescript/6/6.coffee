# 6.coffee

# video

coffee =
	name		: "French"
	strength	: 1
	brew		: -> alert "brewing #{@name}" 
	pour		: (amount=1) ->
		if amount is 1
			"poured a single cup"
		else
			"Poured #{amount} cups"

class Coffee
	constructor	: (name, strength=1) ->
		@name = name
		@strength = strength


class Coffee
	constructor: (@name, @strength=1) ->
	brew		: -> alert "brewing #{@name}" 
	pour		: (amount=1) ->
		if amount is 1
			"poured a single cup"
		else
			"Poured #{amount} cups"

french = new Coffee("French", 2)

class MaxgoodHouse extends Coffee
	constructor: (@name, @strength=0) ->
		@branch = "Maxgood House"
	brew		: -> alert "brewing #{brand} #{@name}" 
	pour		: (amount=1) ->
		"#{super(amount)}, but it sucks"

maxgoodHouse = new MaxgoodHouse("bleah")


class Coffee
	constructor	: (@name, @strength=1, @inventory=0) ->
	pourClick	: ->
		$("#pour-#{@name}").click(event) =>
			if @inventory isnt 0
				@inventory -= 1
				alert "Poured a cup of #{@name}"




#var selectFlights = {
#	fetchingFlights	: null,
#	init			: function(){
#		$("#tabs ul li a").bind({
#			click: this.changeTab
#		});
#
#		$("#tabs #error a").click(function(event){
#			e.preventDefault();
#			this.showFlights($("#tabs li a.active").attr("href"));
#		});
#	},
#	showFlights		: function(activeDiv){},
#	changeTab		: function(event){}
#};

class SelectFlights
	constructor: (@fetchingFlights=null) ->
		$("#tabs ul li a").bind
			click: this.changeTab
		
		$("#tabs #error a").click (event) =>
			event.preventDefault()
			@.showFlights $("#tabs li a.active").attr "href"
	showFlights		: (activeDiv) ->
	changeTab		: (event) =>

selectFlights = new SelectFlights()
		








# 6.1
coffee =
  name: 'Russian'
  level: 2
  isRussian: -> @name is 'Russian'


class Coffee
	constructor : (@name, @level) ->
	isRussian	: -> @name is 'Russian'



# 6.2
coffee = new Coffee "Zachary", 3


# 6.3
class Coffee
  constructor: (name, level) ->
    @name = name
    @level = level or 0

  isRussian: -> @name is 'Russian'


class Coffee
  constructor: (@name, @level=0) ->
  isRussian: -> @name is 'Russian'


# 6.4

class Coffee
  constructor: (@name, @level=0) ->

class Coffee extends Drink
  constructor	: (@name, @level=0) ->
  serve		: (sleeve=false)->
    if @sleeve? then false else super


#6 .5
class DrinkLink
	watchClick: ->
		$("a").click (event) ->
			$(@).css('color', '#F00')



# 6.6
class DrinkLink
  constructor: (@linkClicked=false) ->
  watchClick: ->
    $('.drink a').click (event) ->
      $(event.target).css('color', '#F00')
      @linkClicked = true

class DrinkLink
  constructor: (@linkClicked=false) ->
  watchClick: ->
    $('.drink a').click (event) =>
      $(event.target).css('color', '#F00')
      @linkClicked = true






