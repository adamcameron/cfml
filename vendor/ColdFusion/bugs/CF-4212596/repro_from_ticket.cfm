<!--- Create spreadsheet --->
<cfset spreadSheet = spreadsheetNew()>
<!---Write data to spreadsheet --->
<cfloop from="1" to=1000 index="i">
<cfset val = "12#i#-#i#">
<cfset spreadsheetAddRow(spreadSheet, "#val#")>
</cfloop>
<!--- Write spreadsheet --->
<cfspreadsheet action="write" filename = "#expandpath('.')#/testExcel_#server.coldfusion.productVersion#.xls" name="spreadSheet" overwrite=true></cfspreadsheet>
