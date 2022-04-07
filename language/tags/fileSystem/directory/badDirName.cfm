<cfset sDir = "C:\non-existent">
<cfif directoryExists(sDir)>
	<cfdirectory action="list" directory="#sDir#" name="q">
	<cfdump var="#q#">
<cfelse>
	<cfoutput>[#sDir#] does not exist</cfoutput>
</cfif>