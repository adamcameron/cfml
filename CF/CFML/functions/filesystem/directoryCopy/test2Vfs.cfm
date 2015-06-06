<cfset sDir = expandPath("../")>

<cfset qDir = directoryList(sDir, true, "query")>
<cfdump var="#qDir#">


<cfloop query="qDir">
	<cfset sRamDir = replace(replace(directory, sDir, "ram:///", "ONE"), "\", "/", "ALL")>
	<cfif not directoryExists(sRamDir)>
		<cfset directoryCreate(sRamDir)>
	</cfif>
	<cfif type eq "file">
		<cfset fileCopy(directory & "\" & name, sRamDir & "/" & name)>
	</cfif>
</cfloop>
<cfset q = directoryList("ram:///", true, "query")>
<cfdump var="#q#">
<cfabort>