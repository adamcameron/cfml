<cfset numbers = ["tahi", "rua", "toru", "wha"]>
<cfloop index="i" item="number" array="#numbers#">
	<cfoutput>index: #i#; element: #number#<br></cfoutput>
</cfloop>