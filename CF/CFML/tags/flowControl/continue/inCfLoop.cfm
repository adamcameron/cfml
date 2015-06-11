<cfloop index="i" from="1" to="10">
	<cfif i mod 2><cfscript>continue;</cfscript></cfif>
	<cfoutput>[#i#] EVEN<br /></cfoutput>
</cfloop>