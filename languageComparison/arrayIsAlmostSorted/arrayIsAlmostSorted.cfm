<cfscript>
function arrayIsAlmostSorted(array){
	var sorted = duplicate(array).sort("numeric");

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



tests = [
	// sorted
	/*[true,[1,2,3,4,5]]
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
	 ,*/[false,[1,2,3,5,2]]
];


for (test in tests){
	expectation = test[1];
	testArray = test[2];
	writeOutput(serializeJson(testArray) & " => " & arrayIsAlmostSorted(testArray) & " (Expectation: " & expectation & ")<br>");
}
</cfscript>
