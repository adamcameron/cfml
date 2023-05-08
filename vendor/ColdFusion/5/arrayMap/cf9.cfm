<cfscript>
// cf9.cfm
array function arrayMap(required array array, required any callback){
	var mappedArray = [];
	var arrLen		= arrayLen(array);

	if (!isCustomFunction(callback)){
		throw(type="InvalidArgumentException", message="The 'callback' argument must be a function");
	}

	for (var i=1; i <= arrLen; i++){
		arrayAppend(mappedArray, callback(array[i], i, array));
	}
	return mappedArray;
}

string function toUpper(required string string){
	return ucase(string);
}

mappedArray = arrayMap(["tahi","rua","toru","wha"], toUpper);
writedump(mappedArray);
</cfscript>