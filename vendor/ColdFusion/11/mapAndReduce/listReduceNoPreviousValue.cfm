<cfscript>
// listReduceNoPreviousValue.cfm
numbers = "1,2,3,4,5,6,7,8,9,10";

sum = numbers.reduce(function(previousValue, value){
	if (!structKeyExists(arguments, "previousValue")){
		return value;
	}
	return previousValue + value;
});
writeOutput("The sum of the digits #numbers# is #sum#<br>");

product = numbers.reduce(function(previousValue=1, value){
	return previousValue * value;
});
writeOutput("The product of the digits #numbers# is #product#<br>");
</cfscript>