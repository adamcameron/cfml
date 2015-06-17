<cfset _COL_1 = "OK">

<cftry>
	<cfset q = queryNew("A_COL_1")>
	<cfcatch>
		<cfdump var="#variables#">
	</cfcatch>
</cftry>