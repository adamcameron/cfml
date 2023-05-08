<cfloop index="index" item="item" collection="#baseStruct#">
	<cfset result = result.listAppend("#index#:#item#")>
</cfloop>