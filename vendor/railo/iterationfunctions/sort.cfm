<cfscript>
numbers = [
	{maori="wha", digit=4},
	{maori="toru", digit=3},
	{maori="rua", digit=2},
	{maori="tahi", digit=1}
]

arraySort(numbers, function(v1,v2){
	return sgn(v1.digit - v2.digit)
})
dump(numbers)
echo("<hr>")

numbers.sort(function(v1,v2){
	return sgn(v2.digit - v1.digit)
})
dump(numbers)
</cfscript>