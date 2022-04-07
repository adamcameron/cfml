<cfscript>
param name="URL.showTelemetry" default=false; // need a semicolon here for some reason

numbers = ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"]

every = numbers.every(function(v,i,a){
	if (URL.showTelemetry) echo("Checking: #i# #v#<br>")
	return v.length() >= URL.length
})
echo("Are all of #numbers.toString()# at least #URL.length# characters long? #every#<hr>")
</cfscript>