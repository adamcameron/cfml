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



var tests = [
    // sorted
     [true,[1,2,3,4,5]]
    ,[true,[2,4,6,8,10]]
    
    // 1 swap
    ,[true,[1,2,3,5,4]]
    ,[true,[5,2,3,4,1]]
    ,[true,[1,2,3,5,3]]
    
    // +1 swap
    ,[false,[5,2,3,1,4]]
    ,[false,[2,3,1,5,4]]
    ,[false,[5,1,2,3,4]]
    ,[false,[2,3,1,5,4]]
    ,[false,[2,3,1,4,5]]
    ,[false,[1,2,3,5,2]]
];


tests.forEach(function(test){
	var expectation = test[0];
	var testArray = test[1];
	console.log(JSON.stringify(testArray) + " => " + arrayIsAlmostSorted(testArray) + " (Expectation: " + expectation + ")");
});





















/*
function arrayIsAlmostSorted(array) {
	var tally = 0;
	var working = array.slice(0);

	return working.every(function(e1, i){
		var compare = working.slice(i+1);
		return compare.every(function(e2){
			console.log("Comparing " + e1 + " to " + e2 + "(" + (e1 > e2) + ")")
			if (e1 > e2) tally++;
			return tally <= 1;
		});
	});
}

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
*/
