component {


/**
* @hint ref https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce
* @array Array to reduce
* @callback Callback function to use to reduce. Will receive the following arguments: previousValue, currentValue, index, array
* @initialValue The initial value to use to start the reduction
*/

any function arrayReduce(required array array, required any callback, any initialValue){
	var startIdx = 1;
	if (!structKeyExists(arguments, "initialValue")){
		if (arrayLen(array) > 0){
			var result = callback(result, array[1], 1, array);
			startIdx = 2;
		}else{
			return;
		}
	}else{
	    var result = initialValue;
	}
    for (var i=startIdx; i <= arrayLen(array); i++){
        result = callback(result, array[i], i, array);
    }
    return result;
}



}