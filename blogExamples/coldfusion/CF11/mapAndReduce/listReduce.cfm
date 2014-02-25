<cfscript>
// listReduce.cfm
numbers = "1,2,3,4,5,6,7,8,9,10";

sum = listReduce(
	numbers,
	function(previousValue, value){
		return previousValue + value;
	}
);
writeOutput("The sum of the digits #numbers# is #sum#<br>");

product = numbers.reduce(
	function(previousValue, value){
		return previousValue  * value;
	}
);
writeOutput("The product of the digits #numbers# is #product#<br>");
</cfscript>