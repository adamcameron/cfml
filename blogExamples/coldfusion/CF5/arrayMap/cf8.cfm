<cffunction name="arrayMap" returntype="array" output="false">
	<cfargument name="array" type="array" required="true">	
	<cfargument name="callback" type="any" required="true">	

	<cfscript>
		var mappedArray = [];
		var arrLen		= arrayLen(array);
		var i			= 0;

		if (!isCustomFunction(callback)){
			throw(type="InvalidArgumentException", message="The 'callback' argument must be a function");
		}

		for (i=1; i <= arrLen; i++){
			arrayAppend(mappedArray, callback(array[i], i, array));
		}
		return mappedArray;
	</cfscript>
</cffunction>

<cfscript>
originalArray = ["tahi","rua","toru","wha"];

function toUpper(string){
	return ucase(string);
}

mappedArray = arrayMap(originalArray, toUpper);
</cfscript>
<cfdump var="#mappedArray#">