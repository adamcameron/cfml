# 2.coffee

# video

#jQuery(function($){
#	function changeTab(e){
#		e.preventDefault();
#		$("#tabs li a.active").removeClass("active");
#		$(this).addClass("active");
#	}
#	$("#tabs ul li a").click(changeTab);
#};

$ -> 
	changeTab = (e) ->
		e.preventDefault()
		$("#tabs li a.active").removeClass "active"
		$(@).addClass "active"
	
	$("#tabs ul li a").click(changeTab)


#$("#tabs #error a").click(function(e){
#	e.preventDefault();
#});

$("#tabs #error a").click (e) ->
	e.preventDefault()


#$("#confirm").queue(function(){
#	$(this).dequeue();
#});

$("#confirm").queue ->
	$(@).dequeue()


#function showNumberOfFlights(e){
#	var num_flights = $(this).data("flight");
#	$(this).append("<span>" + num_flights + "</span>");
#	$("#tabs span.tooltip").show();
#}

showNumberOfFlights = (e) ->
	num_flights = $(@).data "flights"
	$(@).append "<span>#{num_flights}</span>"
	$("#tabs span.tooltip").show()






# 2.1

# jQuery(function($) {
#   $('#newCoffee a').click(function() {
#     alert('New coffee added');
#   });
# });

$ ->
	$('#newCoffee a').click ->
		alert 'New coffee added'


# 2.2
# $('#newCoffee a').click(function() {
#   var name = prompt('Name of coffee:');
#   alert("New coffee added: " + name);
# });

$('#newCoffee a').click ->
	name = prompt 'Name of coffee:'
	alert "New coffee added: #{name}"

# 2.3
# $('#newCoffee a').click(function() {
#   var coffee, name;
#   name = prompt('Name of coffee:');
#   coffee = $("<li>" + name + "</li>");
#   $('ul.drink').append(coffee);
# });

$('#newCoffee a').click ->
	name = prompt 'Name of coffee:'
	coffee = $ "<li>#{name}</li>"
	$('ul.drink').append coffee

# 2.4
# $('.drink li a').click(function(e) {
#   e.preventDefault();
#   alert($(this).text());
# });

$('.drink li a').click (e) ->
	e.preventDefault()
	alert $(@).text()

# 2.5
# $('.drink li').mouseenter(function() {
#   $(this).find('span').show();
# });
# $('.drink li').mouseleave(function() {
#   $(this).find('span').hide();
# });

$('.drink li').mouseenter ->
	$(@).find('span').show()

$('.drink li').mouseleave ->
	$(@).find('span').hide()

# 2.6
# $('.drink li').hover(function() {
#   $(this).find('span').show();
# }, function() {
#   $(this).find('span').hide();
# });

$('.drink li').hover ->
	$(@).find('span').show()
, ->
	$(@).find('span').hide()



