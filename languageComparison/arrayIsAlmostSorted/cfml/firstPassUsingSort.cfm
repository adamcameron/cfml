<cfscript>
function arrayIsAlmostSorted(array){
	var tally = 0;
	array.sort(function(e1, e2){
		if (e1 > e2) {
			tally++;
		}
		return e2 - e1;
	});
	
	return tally <= 1;
}

tester = new TestResources();

tests = tester.getSimpleTests();

tester.runTests(arrayIsAlmostSorted, tests);
</cfscript>