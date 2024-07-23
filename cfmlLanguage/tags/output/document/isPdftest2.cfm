<cfset sBaseDir = "C:\webroots\shared\cf\cfml\D\document\versions\">
<cfdirectory action="list" directory="#sBaseDir#" name="qFiles">
<cfloop query="qFiles">
	<cfoutput>#name#<br /></cfoutput>
	<cfoutput>isPDFFile() = #isPDFFile(sBaseDir & name)#<br /></cfoutput>
	<cfpdf action="read" source="#sBaseDir & name#" name="oPdf">
	<cfoutput>isPdfObject() = #isPdfObject(oPdf)#<br /></cfoutput>
</cfloop>