# 3.coffee

# video
#if (age < 18){
#	alert("Under age");
#}

alert "Under age" if age < 18

#if (age < 18){
#	alert("Under age");
#}else{
#	alert("of age");
#}

if age < 18
	alert "Under age"
else
	alert "Of age"

# == is / ===
# != isnt / !===
# not / !
# and / &&
# or / ||
# true yes on / true
# false no off / false

if paid() and coffee() is on then pour()

addCaffeine() if not decaf()

addCaffeine() unless decaf()

#if (2 < newLevel && newLevel < 5){
#	alert("In Range!");
#}

alert "In Range!" if 2 < newLevel < 5

#var message = (function(){
#	switch (cupsOfCoffee){
#		case 0:
#			return "Asleep";
#		case 1:
#			return "Eyes Open";
#		case 2:
#			return "Buzzed";
#		default:
#			return "Dangerous";
#	}
#})();

message = switch cupsOfCoffee
	when 0 then "Asleep"
	when 1 then "Eyes Open"
	when 2 then "Buzzed"
	else		"Dangerous"


#if (typeof cupsOfCoffee !=== "undefined" && cupsOfCoffee !=== null){
#	alert("it exists!");
#}

alert "it exists" if cupsOfCoffee?

cupsOfCoffee = false
cupsOfCoffee ?= 0

coffeePot?.brew()

vehicle.start_engine?().shift_gear?()




# 3.1
alert 'High Caffeine Level' if caffeineLevel > 5

# 3.2
#caffeineLevel > 5 ? alert('Too High') : alert('OK');

if caffeineLevel > 5 then alert 'Too High' else alert 'OK'

# 3.3
# if(!coffeeReady){
#   alert('Please wait 5 more minutes.')
# }

alert 'Please wait 5 more minutes.' unless coffeeReady

# 3.4

#if lowLevel < newLevel && newLevel < highLevel
#  alert 'ok'
#else
#  alert 'abnormal caffeine level'


if lowLevel < newLevel < highLevel
  alert 'ok'
else
  alert 'abnormal caffeine level'

# 3.5

# if (newLevel === 1) {
#   message = 'Out of bed yet?';
# } else if (newLevel === 2) {
#   message = 'Good morning!';
# } else {
#   message = 'You should stop while you can';
# }

message = switch newLevel
	when 1 then 'Out of bed yet?'
	when 2 then 'Good morning!'
	else 'You should stop while you can'

# 3.6
# if (typeof newLevel !== "undefined" && newLevel !== null){
#   checkLevel(newLevel);
# } else {
#   resetLevel();
# }


if newLevel?
  checkLevel newLevel
else
  resetLevel()


# 3.7
#if level?
#  checkLevel(level)
#else
#  resetLevel()

if level?
  checkLevel?(level)
else
  resetLevel?()




















