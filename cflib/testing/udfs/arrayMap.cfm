<cffunction name="_arrayMapOrig" output="false" returntype="array">
	<cfargument name="arr" type="array" required="true">
	<cfargument name="func" type="function" required="true">
	
	<cfset var results = []>
	
	<cfloop from="1" to="#arrayLen(arr)#" index="local.index">
		<cfset arrayAppend(results, func(arr[index], index, arr))>
	</cfloop>
	
	<cfreturn results> 
</cffunction>

<cfscript>
array function _arrayMap(required array array, required function f){
	var result = [];
	for (var i=1; i <= arrayLen(array); i++){
		arrayAppend(result, f(array[i], i, array));
	}
	return result;
}
</cfscript>
