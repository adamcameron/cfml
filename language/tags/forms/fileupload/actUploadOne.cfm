<cfset sDir = expandPath("./uploadedFiles/")>
<cftry>
	<cfdirectory action="delete" directory="#sDir#" recurse="true">
	<cfdirectory action="create" directory="#sDir#">
	<cfcatch>
	</cfcatch>
</cftry>

<cffile	action		= "upload"
		destination = "#sDir#"
		nameConflict= "makeunique"
		result		= "stResult"
>
<cfdump var="#stResult#" output="#sDir#cffile_dump.html">
