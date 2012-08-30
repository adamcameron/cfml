<cfset numbers = ["tahi", "rua", "toru", "wha"]>

<cfloop index="i" from="1" to="#arrayLen(numbers)#">
	<cfset number = numbers[i]>
	<cfoutput>#number#<br /></cfoutput>

	<cfif number EQ "tahi">
		<cfset arrayAppend(numbers, "rima")>
	</cfif>
</cfloop>

<cfdump var="#numbers#">