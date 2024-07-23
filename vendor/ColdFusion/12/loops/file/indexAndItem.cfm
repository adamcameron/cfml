<cfloop index="index" item="item" file="#baseFile#">
	<cfset result = result.listAppend("#index#:#item#")>
</cfloop>