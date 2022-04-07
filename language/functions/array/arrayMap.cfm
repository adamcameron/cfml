<cfscript>
array function arrayMap(required array array, required any f){
	if (!isCustomFunction(f)){
		throw(type="InvalidArgumentException", message="The 'f' argument must be a function");
	}

	var result	= [];
	var arrLen	= arrayLen(array);
	for (var i=1; i <= arrLen; i++){
		arrayAppend(result, f(array[i], i, array));
	}
	return result;
}

string function toUpper(required string string){
	return ucase(string);
}

mappedArray = arrayMap(["tahi","rua","toru","wha"], toUpper);
writedump(mappedArray);
</cfscript>