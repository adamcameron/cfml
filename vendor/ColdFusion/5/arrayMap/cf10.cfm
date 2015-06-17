<cfscript>
// cf10.cfm
array function arrayMap(required array array, required function callback){
	var mappedArray = [];
	var arrLen		= arrayLen(array);

	for (var i=1; i <= arrLen; i++){
		arrayAppend(mappedArray, callback(array[i], i, array));
	}
	return mappedArray;
}

mappedArray = arrayMap(["tahi","rua","toru","wha"], function(required string string){
	return ucase(string);
});
writedump(mappedArray);
</cfscript>