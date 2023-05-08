<cfloop index="index" item="item" array="#baseArray#">
	<cfset result = result.listAppend("#index#:#item#")>
</cfloop>