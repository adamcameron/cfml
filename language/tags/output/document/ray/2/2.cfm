<cfset sPdfFilePath = "C:\webroots\shared\cf\cfml\D\document\versions\sample.1.0.pdf">
<cfif isPDFFile(sPdfFilePath)>
   <cfpdf action="read" source="#sPdfFilePath#" name="oPdf">
   <cfdump var="#oPdf#">
	<cfpdf action="getinfo" name="stInfo" source="#sPdfFilePath#">
	   <cfdump var="#stInfo#">

</cfif>