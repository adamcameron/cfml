<cfscript>
arrayIsAlmostSorted = function(array){
	scan = duplicate(array)
	scan.deleteAt(1)
	compare = duplicate(array)
	compare.deleteAt(array.len())

	swaps = 0
	scan.some(function(v, i){
		if (v > compare[i]) {
			swaps++
		}
		return swaps > 1
		
	})
	return swaps <= 1
}

LuceeTester::runTests(arrayIsAlmostSorted)
</cfscript>
