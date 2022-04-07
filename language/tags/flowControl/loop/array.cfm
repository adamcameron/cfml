<cfset a = listToArray("one,deux,san,vier")>

<cfloop array="#a#" index="sItem">
	<cfoutput>#sItem#</cfoutput><br/>
</cfloop>