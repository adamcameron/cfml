<!--- cfmx7.cfm --->
<cffunction name="arrayMap" returntype="array" output="false">
	<cfargument name="array" type="array" required="true">	
	<cfargument name="callback" type="any" required="true">	

	<cfset var mappedArray	= arrayNew(1)>
	<cfset var arrLen		= arrayLen(array)>
	<cfset var i			= 0>

	<cfif not isCustomFunction(callback)>
		<cfthrow type="InvalidArgumentException" message="The 'callback' argument must be a function">
	</cfif>

	<cfloop index="i" from="1" to="#arrayLen(array)#">
		<cfset arrayAppend(mappedArray, callback(array[i], i, array))>
	</cfloop>
	<cfreturn mappedArray>
</cffunction>

<cfscript>
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