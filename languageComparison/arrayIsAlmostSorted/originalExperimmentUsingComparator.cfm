<cfscript>
tester = new Tester();

arrayIsAlmostSorted = function(array){
	var swaps = 0;
	var working = duplicate(array);

	tester.outputMessage(array.toJson());

	working.sort(function(a,b){
		var comparison = a - b;
		if (comparison < 0){
			swaps++;
		}
		tester.outputMessage("#a# #b# #comparison# #swaps#");
		return comparison;
	});
	return swaps <= 1;
};

tester.runTests(arrayIsAlmostSorted, [8]);
</cfscript>
