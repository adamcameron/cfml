<cfloop item="item" query="#baseQuery#">
	<cfset result = result.listAppend("#item.index#:#item.element#")>
</cfloop>