<cfset numbers = ["tahi", "rua", "toru", "wha"]>

<cfloop index="number" array="#numbers#">
	<cfoutput>#number#<br /></cfoutput>

	<cfif number EQ "tahi">
		<cfset arrayAppend(numbers, "rima")>
	</cfif>
</cfloop>

<cfdump var="#numbers#">