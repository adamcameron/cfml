<cfscript>
numbers = ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"]

echo("Does #numbers.toString()# contain any numbers starting with '#URL.letter#'?<br>");
any = numbers.some(function(v,i,a){
	echo("Checking: #i# #v#<br>")
	return v[1] == URL.letter
})
echo("Result: #any#<hr>");

echo("Are all of #numbers.toString()# at least #URL.length# characters long?<br>");
all = numbers.every(function(v,i,a){
	echo("Checking: #i# #v#<br>")
	return v.length() >= URL.length
});
echo("Result: #all#<hr>");
</cfscript>