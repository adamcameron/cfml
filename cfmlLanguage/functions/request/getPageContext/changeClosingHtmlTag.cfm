<cfset outputBuffer=getPageContext().getOut().getString()>
<cfset updatedBuffer = replaceNoCase(outputBuffer, "</html>", "#debugStuffHere#</hhml>")>
<cfset getPageContext().getOut().clearBuffer()>
<cfoutput>#updatedBuffer#</cfoutput>