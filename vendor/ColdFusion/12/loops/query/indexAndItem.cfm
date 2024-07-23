<cfloop index="index" item="item" query="#baseQuery#">
	<cfset result = result.listAppend("#index#:#item.index#:#item.element#")>
</cfloop>