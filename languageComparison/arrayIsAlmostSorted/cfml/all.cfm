<cfscript>
function arrayIsAlmostSorted(array){
	var sorted = duplicate(array);
	sorted.sort("numeric");
	
	var breakOnBoolean = function(b){
		return function(array, callback){
			var lengthOfArray = array.len();
			var result = !b;
			for (var i=1; i <= lengthOfArray; i++) {
				result = callback(array[i], i);
				if (result == b) {
					return result;
				}
			}
			return result;
		};
	};
	var some = breakOnBoolean(true);
	var every = breakOnBoolean(false);
	
	var arraysAreEquivalent = function(a1, a2) {
		return every(a1, function(v, i){
			return v == a2[i];
		});
	};
	
	return some(array, function(_, i){
		var restOfArray = duplicate(array).slice(i);

		return some(restOfArray, function(_, j){
			var indexToSwapWith = i + j -1;
			var swappedArray = duplicate(array);
			swappedArray.swap(i, indexToSwapWith);
			return arraysAreEquivalent(sorted, swappedArray);
		});
	});
}

tests = [
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


tests.each(function(test){
	var expectation = test[1];
	var testArray = test[2];
	writeOutput(serializeJson(testArray) & " => " & arrayIsAlmostSorted(testArray) & " (Expectation: " & expectation & ")<br>");
});

</cfscript>