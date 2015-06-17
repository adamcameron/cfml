<cftry>
<cfdirectory action="create" directory="C:\temp\deleteme\intermediary\path\does\not\exist">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>