<cfset sThisDir = expandPath("./")>
<cfset sSrcFile = "crash">
<cfset sSrcPdf	= "#sSrcFile#.pdf">

<cfoutput>#isPdfFile(sSrcPdf)#</cfoutput>