<cfscript>
/**
* @hint CFML implementation of Array.reduce(), similar to Javascript's one ref https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce
* @array Array to reduce
* @callback Callback function to use to reduce. Will receive the following arguments: element (of current iteration of the all), index, array, (optional) result (of preceeding call to callback())
* @initialValue The initial value to use to start the reduction
*/
public any function arrayReduce(required array array, required any callback, any initialValue){
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
// example usage()

// eg 1:
function add(required numeric currentValue, required numeric index, required array array, numeric previousValue){
	return previousValue + currentValue;
}


result = arrayReduce([1,2,3,4], add, 0);

writeDump([result]);


// eg 2:
function append(required struct currentValue, required numeric index, required array array, struct previousValue){
	structAppend(previousValue, currentValue);
	return previousValue;
}

result = arrayReduce([{one="tahi"}, {two="rua"}, {three="toru"}, {four="wha"}], append, {});

writeDump(result);
</cfscript>