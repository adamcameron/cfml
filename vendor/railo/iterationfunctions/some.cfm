<cfscript>
param name="URL.showTelemetry" default=false; // need a semicolon here for some reason

numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"]

some = numbers.some(function(v,i,a){
	if (URL.showTelemetry) echo("Checking: #i# #v#<br>")
	return v[1] == URL.letter
})
echo("Does #numbers.toString()# contain any numbers starting with '#URL.letter#'? #some#<hr>")
</cfscript>