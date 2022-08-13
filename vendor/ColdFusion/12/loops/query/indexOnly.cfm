<cfloop index="index" query="#baseQuery#">
	<cfset result = result.listAppend("#index.index#:#index.element#")>
</cfloop>