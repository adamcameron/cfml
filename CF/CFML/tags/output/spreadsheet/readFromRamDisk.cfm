<cffile action="copy" source="C:\webroots\shared\cf\cfml\output\spreadsheet\fromGoogle.xls" destination="ram:///fromGoogle.xls">
<cfspreadsheet action="read" src="C:\webroots\shared\cf\cfml\output\spreadsheet\fromGoogle.xls" name="oXls">
<cfdump var="#oXls#">
<cftry>
<cfspreadsheet action="read" src="ram:///fromGoogle.xls" name="oXls">
<cfdump var="#oXls#">
<cfcatch>
<cfdump var="#cfcatch#">
</cfcatch>
</cftry>

<cffile action="read" file="ram:///fromGoogle.xls" variable="sXls">
<cfdump var="#sXls#">