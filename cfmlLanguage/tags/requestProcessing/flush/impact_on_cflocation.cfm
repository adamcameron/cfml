<!--- <cfflush interval="50"> --->
<cfloop index="i" from="1" to="200">
	<cfoutput>#repeatString(" ", 50)#</cfoutput>Yo mamma<br />
</cfloop>

<cflocation url="./target.cfm" addtoken="false">