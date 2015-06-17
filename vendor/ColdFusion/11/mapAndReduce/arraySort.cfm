<cfscript>
// arraySort.cfm

numbers = [
	{digit=4, word="wha"},
	{digit=2, word="rua"},
	{digit=1, word="tahi"},
	{digit=3, word="toru"}
];
arraySort(numbers, function(v1,v2){
	return sgn(v1.digit - v2.digit);
});
writeDump(var=numbers);

</cfscript>