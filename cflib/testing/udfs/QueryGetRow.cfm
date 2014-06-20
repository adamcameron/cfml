<cffunction name="_queryGetRowOld" output="false" returntype="struct"
			hint="https://wikidocs.adobe.com/wiki/display/coldfusionen/QueryGetRow">
	<cfargument name="query" type="query" required="true">
	<cfargument name="row" type="numeric">
	
	<cfif !structKeyExists(arguments, "row")>
		<cfset row = query.currentRow>
	</cfif>
	
	<cfset var struct = {}>

	<cfloop list="#query.columnList#" index="local.col">
		<cfset struct[lcase(col)] = query[col][row]>
	</cfloop>

	<cfreturn struct>
</cffunction>

<cfscript>
/**
* @hint https://wikidocs.adobe.com/wiki/display/coldfusionen/QueryGetRow
*/
public struct function _queryGetRow(required query query, numeric row){
	if (!structKeyExists(arguments, "row")){
		row = query.currentRow;
	}
	
	var struct = {};
	for (var col in listToArray(query.columnList)){
		struct[lcase(col)] = query[col][row];
	}

	return struct;
}
</cfscript>