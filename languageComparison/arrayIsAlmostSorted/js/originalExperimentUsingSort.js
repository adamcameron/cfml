"use strict"

function arrayIsAlmostSorted(array){
	let tally = 0;
	array.sort(function(e1, e2){
		let comparison = e2 - e1;
		if (comparison < 0) {
			tally++;
		}
		return comparison;
	});
	
	return tally <= 1;
}

require("./Tester.js").runTests(arrayIsAlmostSorted);
