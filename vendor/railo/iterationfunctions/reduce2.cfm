<cfscript>
numbers = [1,2,3,4]
sum = numbers.reduce(
	function(prev,current){
		return prev+current;
	},
	0 // this is the starting point
)
dump([numbers,sum])
</cfscript>