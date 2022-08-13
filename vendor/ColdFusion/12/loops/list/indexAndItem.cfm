<cfloop index="index" item="item" list="#baseList#">
	<cfset result = result.listAppend("#index#:#item#")>
</cfloop>