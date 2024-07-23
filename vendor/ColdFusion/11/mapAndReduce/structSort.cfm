<cfscript>
// structSort.cfm

numbers = {
	four = {digit=4, word="wha"},
	two = {digit=2, word="rua"},
	one = {digit=1, word="tahi"},
	three ={digit=3, word="toru"}
};
structSort(numbers, function(v1,v2){
	return sgn(v1.digit - v2.digit);
});
writeDump(var=numbers);

</cfscript>