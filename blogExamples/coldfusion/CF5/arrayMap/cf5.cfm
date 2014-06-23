<cfscript>
function arrayMap(array, callback){
	var mappedArray = arrayNew(1);
	var i			= 0;
	var arrLen		= arrayLen(array);

	for (i=1; i LTE arrLen;  i=i+1){
		arrayAppend(mappedArray, callback(array[i], i, array));
	}
	return mappedArray;
}

originalArray		= arrayNew(1);
originalArray[1]	= "tahi";
originalArray[2]	= "rua";
originalArray[3]	= "toru";
originalArray[4]	= "wha";

function toUpper(string){
	return ucase(string);
}

mappedArray = arrayMap(originalArray, toUpper);
</cfscript>
<cfdump var="#mappedArray#">