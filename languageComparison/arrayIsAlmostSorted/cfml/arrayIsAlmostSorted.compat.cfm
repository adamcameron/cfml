<cfscript>
function arrayIsAlmostSorted(array){
	var sorted = duplicate(array);
	sorted.sort("numeric");

	var breakOnResult = function(b){
		return  function(array, callback){
			var lengthOfArray = array.len();
			var result = !b;
			for (var i=1; i <= lengthOfArray; i++) {
				result = callback(array[i], i);
				if (result == b) break;
			}
			return result;
		};
	};
	var some = breakOnResult(true);
	var every = breakOnResult(false);

	var arraysAreEquivalent = function(a1, a2){
		return every(a1, function(el, i){
			return el == a2[i];
		});
	};

	if (arraysAreEquivalent(array, sorted)) {
		return true;
	}

	return  some(array, function(_, i1){
		var restOfArray = duplicate(array).slice(i1);
		return some(restOfArray, function(_, i2) {
			var indexToSwapWith = i1 + i2 - 1;
			var swappedArray = duplicate(array);
			swappedArray.swap(i1, indexToSwapWith);
			return arraysAreEquivalent(sorted, swappedArray);
		});
	});
}

new Tester().runTests(arrayIsAlmostSorted);
</cfscript>
