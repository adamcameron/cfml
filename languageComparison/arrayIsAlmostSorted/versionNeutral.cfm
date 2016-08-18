<cfscript>
function arrayIsAlmostSorted(array){
	var sorted = duplicate(array);
	sorted.sort("numeric");
	
	if (array.equals(sorted)){
		return true;
	}
	
	var some = function(array, callback) {
		var result = false;
		var arrayLength = array.len();
		for (var i=1; i <= arrayLength; i++){
			result = callback(array[i], i);
			if (result) break;
		}
		return result;
	};
	
	return some(array, function(_, i1){
		var restOfArray = array.slice(i1);
		return some(restOfArray, function(_, i2){
			var indexToSwapWith = i1 + i2 - 1;
			var swappedArray = duplicate(array);
			swappedArray.swap(i1, indexToSwapWith);
			return sorted.equals(swappedArray);
		});
	});
}

new Tester().runTests(arrayIsAlmostSorted);
</cfscript>
