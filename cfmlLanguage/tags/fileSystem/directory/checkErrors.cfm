<cftry>
	<cfdirectory action="delete" directory="C:\temp\deleteme\">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>