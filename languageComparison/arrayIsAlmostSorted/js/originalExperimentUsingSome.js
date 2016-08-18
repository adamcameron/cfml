"use strict";

let arrayIsAlmostSorted = function(array){
	let scan = array.slice(0);
	scan.pop();
	let compare = array.slice(0);
	compare.shift();

	let swaps = 0;
	scan.some(function(v, i){
		if (v > compare[i]) {
			swaps++;
		}
		//console.log(`${v} ${compare[i]} ${swaps}`);
		return swaps > 1;
		
	});
	return swaps <= 1;
};

require("./Tester.js").runTests(arrayIsAlmostSorted);
