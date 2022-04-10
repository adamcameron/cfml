<cfscript>
	sDir			= expandPath("./");
	sFileRoot		= "Monkey [portrait]";
	sSrcFileName	= "#sFileRoot#.jpg";
	sSrcFilePath	= "#sDir##sSrcFileName#";

	sDestFileName	= "#sFileRoot#_new.jpg";
	sDestFilePath	= "#sDir##sDestFileName#";
</cfscript>

<cfif fileExists(sSrcFilePath)>
	<cfimage action="info" source="#sSrcFilePath#" structname="st">
	<cfdump var="#st#">
	<cfimage action="resize" height="200%" width="200%" source="#sSrcFilePath#" destination="#sDestFilePath#" overwrite="true">
<cfelse>
	Cannot find <cfoutput>[#sSrcFilePath#]</cfoutput>
</cfif>
