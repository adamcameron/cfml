<cfset sDest = "C:\temp\pdfs\merged.pdf">
<cfif fileExists(sDest)>
	<cffile action="delete" file="#sDest#">
</cfif>

<cfset iStart = getTickCount()>
<cfpdf action="merge" directory="C:\temp\pdfs\src\" destination="#sDest#" overwrite="yes">
<cfoutput>
Execution Time: #getTickCount()-iStart#ms<br />
File Exists: #fileExists(sDest)#<br />
</cfoutput>