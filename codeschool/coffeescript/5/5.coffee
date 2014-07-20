# 5.coffee

# video
#$("#tabs ul li a").bind({
#	click		: changeTab,
#	mouseenter	: showNumberOfFlights,
#	mouseleave	: hideNumberOfFlights
#});

$("#tabs ul li a").bind 
	click		: changeTab
	mouseenter	: showNumberOfFlights
	mouseleave	: hideNumberOfFlights

#function showFlights(activeDiv){
#	$("#tabs div").hide();
#
#	if (fetchingFlights){
#		fetchingFlights.abort();
#	}
#
#	fetchingFlights = $.ajax(
#		"/flights",
#		{
#			data	: 
#				date: activeDiv
#			cache	: false
#			error	: function(result){
#				if (result.statusText != "abort"){
#					$("#tabs #error").show();
#				}
#			}
#		}
#	);
#}

showFlights = (activeDiv) ->
	$("#tabs div").hide()

	fetchingFlights.abort() if fetchingFlights

	fetchingFlights = $.ajax "/flights",
		data : 
			date: activeDiv
		cache	: false
		error	: (result) ->
			$("#tabs #error").show() if result.statusText isnt "abort"

#var filteredFlights = [];
#$.each(currentFlights, function(index, flight){
#	if (stops == "2+" || flight.routing == 0){
#		filteredFlights.push(flight);
#	}
#});

filteredFlights = []
$.each currentFlights (index,flight) ->
	if stops is "2+" or flights.routing is 0
		filteredFlights.push flight


filteredFlights = (flight for flight in currentFlights when stops is "2+" or flight.routing is 0)



# 5.1
# jQuery(function($){
#   $('.drink a').click(function(){
#     var newStyle = {
#       'color': '#F00',
#       'font-weight': 'bold'
#     };
#     $(this).css(newStyle)
#   });
# });

$ ->
	$('.drink a').click ->
		newStyle = 
			'color': '#F00'
			'font-weight': 'bold'
		$(@).css newStyle

# 5.2

coffeeList = 
	init : -> $('.drink a').click (e) ->
		e.preventDefault()
		alert $(@).text()
coffeeList.init()

# 5.3
# $.ajax({
#   url: '/coffeeList',
#   method: 'GET',
#   success: function(results) {
#     var i = null
#       , coffee = null;
#     for (i = 0; i < results.length; i++) {
#       coffee = results[i];
#       if (coffee.level > 3) {
#         $('ul.drink').append("<li>" + coffee.name + "</li>")
#       }
#     }
#   },
#   error: function(results) {
#     alert("failure " + results);
#   }
# });


$.ajax 
	url		: '/coffeeList'
	method	: 'GET'
	success	: (results) ->
		$("ul.drink").append("<li>#{coffee.name}</li>") for coffee in results when coffee.level > 3
	error	: (results) ->
		 alert "failure #{results}"
















