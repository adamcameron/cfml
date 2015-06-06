component extends="mxunit.framework.TestCase" {
/**
* @hint CFML implementation of Array.reduce(), similar to Javascript's one ref https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce
* @array Array to reduce
* @callback Callback function to use to reduce. Will receive the following arguments: element (of current iteration of the all), index, array, (optional) result (of preceeding call to callback())
* @initialValue The initial value to use to start the reduction
*/
private any function arrayReduce(required array array, required any callback, any initialValue){
	var startIdx = 1;
	if (!structKeyExists(arguments, "initialValue")){
		if (arrayLen(array) > 0){
			var result = callback(array[1], 1, array);
			startIdx = 2;
		}else{
			return;
		}
	}else{
		var result = initialValue;
	}
	for (var i=startIdx; i <= arrayLen(array); i++){
		result = callback(array[i], i, array, result);
	}
	return result;
}

	// empty array

	public void function testEmptyArrayNoInitiaValue(){
		var result = arrayReduce([], toList);
		
		assertTrue(isNull(result), "Result should have been null");
	}


	public void function testEmptyArrayWithBlankInitiaValue(){
		var result = arrayReduce([], toList, "");
		
		assertEquals("", result, "Result should have been an empty string");
	}


	public void function testEmptyArrayWithTestInitiaValue(){
		var result = arrayReduce([], toList, "test");
		
		assertEquals("test", result, "Result should have been an empty string");
	}


	// single-element array

	public void function testSingleElementArrayNoInitiaValue(){
		var result = arrayReduce(["tahi"], toList);
		
		assertEquals("tahi", result, "Incorrect value returned");
	}

	public void function testSingleElementArrayWithInitiaValue(){
		var result = arrayReduce(["rua"], toList, "tahi");
		
		assertEquals("tahi,rua", result, "Incorrect value returned");
	}


	// multiple-element array

	public void function testMultipleElementArrayNoInitiaValue(){
		var result = arrayReduce(["tahi", "rua", "toru", "wha"], toList);
		
		assertEquals("tahi,rua,toru,wha", result, "Incorrect value returned");
	}

	public void function testMultipleElementArrayWithInitiaValue(){
		var result = arrayReduce(["rua", "toru", "wha"], toList, "tahi");
		
		assertEquals("tahi,rua,toru,wha", result, "Incorrect value returned");
	}


	// misc

	public void function testWithStruct(){
		var result = arrayReduce(listToArray("abbccc", ""), charFrequency);
		assertTrue(isStruct(result) && structCount(result) == 3, "A struct with elements a,b,c should have been returned");
		assertTrue(structKeyExists(result, "a") && result.a == 1, "tally failure");
		assertTrue(structKeyExists(result, "b") && result.b == 2, "tally failure");
		assertTrue(structKeyExists(result, "c") && result.c == 3, "tally failure");
	}



	// test callbacks	
	private function toList(required any currentValue, required numeric index, required array array, any previousValue){
		param name="arguments.previousValue" default="";
		return listAppend(arguments.previousValue, arguments.currentValue);
	}
			
	private function charFrequency(required any currentValue, required numeric index, required array array, any previousValue){
		param name="arguments.previousValue" default={};
		if (structKeyExists(arguments.previousValue, currentValue)){
			arguments.previousValue[currentValue]++;
		}else{
			arguments.previousValue[currentValue] = 1;
		}
		return arguments.previousValue;
	}
			
}