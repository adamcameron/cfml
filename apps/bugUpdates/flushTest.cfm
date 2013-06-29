<cfflush interval="16">
<cfloop index="i" from="1" to="30">
	<cfoutput>#repeatString(chr(randRange(65,90)), 1000)#</cfoutput>
	<cfset sleep(1000)>
</cfloop>