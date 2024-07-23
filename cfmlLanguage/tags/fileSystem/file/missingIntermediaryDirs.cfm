<cftry>
<cffile action="write" file="C:\temp\deleteme\intermediary\path\does\not\exist\file.txt" output="ocelot">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>