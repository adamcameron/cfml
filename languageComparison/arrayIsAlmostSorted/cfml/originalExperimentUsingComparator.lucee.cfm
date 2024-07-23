<cfscript>
arrayIsAlmostSorted = function(array){
	var swaps = 0

	//LuceeTester::outputMessage(serializeJson(array))

	duplicate(array).sort(function(a,b){
		var comparison = a - b
		if (comparison < 0){
			swaps++
		}
		//LuceeTester::outputMessage("#a# #b# #comparison# #swaps#")
		return comparison
	})
	return swaps <= 1
}

LuceeTester::runTests(arrayIsAlmostSorted)
</cfscript>
