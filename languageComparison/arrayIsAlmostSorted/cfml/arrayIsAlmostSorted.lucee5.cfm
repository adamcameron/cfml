<cfscript>
function arrayIsAlmostSorted(array){
	sorted = duplicate(array).sort("numeric")
	
	if (array.equals(sorted)){
		return true
	}
	
	return array.some(function(_, i1){
		restOfArray = array.slice(i1)
		return restOfArray.some(function(_, i2){
			indexToSwapWith = i1 + i2 - 1
			swappedArray = duplicate(array).swap(i1, indexToSwapWith)
			return sorted.equals(swappedArray)
		})
	})
}

LuceeTester::runTests(arrayIsAlmostSorted)
</cfscript>
