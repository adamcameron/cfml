<cfset sPdfFilePath = "C:\webroots\shared\cf\cfml\D\document\versions\sample.1.0.pdf">
<cfif isPDFFile(sPdfFilePath)>
	<cfset data = {author="Raymond Camden", Subject="Paris Hilton", Title="The Wit and Wison of Paris Hilton", KeyWords="paris hilton,wisdom,wit"}>
	<cfpdf action="setinfo" source="#sPdfFilePath#" info="#data#">
	<cfpdf action="getinfo" source="#sPdfFilePath#" name="mdata">
	<cfdump var="#mdata#">
	<cfpdf source="#" destination="C:\webroots\shared\cf\cfml\D\document\versions\sample.1.0_updated.pdf" action="write">
</cfif>