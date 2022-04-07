"use strict";

function arrayIsAlmostSorted(array){
	var sorted = array.slice(0);

	sorted.sort(function(e1, e2){
		return e1 - e2;
	});
	
	var arraysAreEquivalent = function(a1, a2){
		return a1.every(function(el, i){
			return el == a2[i];
		});
	};
	
	if (arraysAreEquivalent(array, sorted)){
		return true;
	}

	var swapElementsInArray = function(a, i1, i2){
		var working = a.slice(0);
		var temp = working[i1];
		working[i1] = working[i2];
		working[i2] = temp;

		return working;
	}
	
	return array.some(function(_, i1){
		var restOfArray = array.slice(i1 + 1);
		return restOfArray.some(function(_, i2){
			var indexToSwapWith = i1 + i2 + 1;
			var swappedArray = swapElementsInArray(array, i1, indexToSwapWith);
			return arraysAreEquivalent(sorted, swappedArray);
		});
	});
}

require("./Tester.js").runTests(arrayIsAlmostSorted);
