<cfset start = getTickCount()>
<cfclient>
<cfset message = "G'day World">
<cfoutput>#message#</cfoutput>
</cfclient>
<cfoutput>Compile time: #getTickCount()-start#ms</cfoutput>