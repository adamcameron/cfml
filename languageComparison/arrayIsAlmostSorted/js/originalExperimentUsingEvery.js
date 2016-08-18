"use strict"

let arrayIsAlmostSorted = function (array) {
	let tally = 0;
	let working = array.slice(0);

	return working.every(function(e1, i){
		let compare = working.slice(i+1);
		return compare.every(function(e2){
			//console.log("Comparing " + e1 + " to " + e2 + "(" + (e1 > e2) + ")")
			if (e1 > e2) {
				tally++;
			}
			return tally <= 1;
		});
	});
}

require("./Tester.js").runTests(arrayIsAlmostSorted);
