<cfscript>
// cf8.cfm
function arrayMap(array, callback){
	var mappedArray = [];
	var arrLen		= arrayLen(array);
	var i			= 0;

	if (!structKeyExisty(arguments, "array")){
		throw(type="MissingArgumentException", message="The 'array' argument is required");
	}
	if (!isArray(array)){
		throw(type="InvalidArgumentException", message="The 'array' argument must be a function");
	}
	if (!structKeyExisty(arguments, "callback")){
		throw(type="MissingArgumentException", message="The 'callback' argument is required");
	}
	if (!isCustomFunction(callback)){
		throw(type="InvalidArgumentException", message="The 'callback' argument must be a function");
	}

	for (i=1; i <= arrLen; i++){
		arrayAppend(mappedArray, callback(array[i], i, array));
	}
	return mappedArray;
}

string function toUpper(required string string){
	return ucase(string);
}

originalArray = ["tahi","rua","toru","wha"];
mappedArray = arrayMap(originalArray, toUpper);
</cfscript>
<cfdump var="#mappedArray#">