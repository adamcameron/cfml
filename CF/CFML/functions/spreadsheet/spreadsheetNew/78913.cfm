

<cfquery name="getBooks" datasource="cfbookclub">
select Title, Genre, BookDescription from books
</cfquery>

<cfset excelFilepath = "#GetDirectoryFromPath(GetCurrentTemplatePath())#" & 'test.xls'>
<cfif fileExists(excelFilepath)>
	<cffile action="delete" file="#excelFilepath#">
</cfif>
<cfset oSpreadsheet = SpreadsheetNew("CourseData")>
<cfset SpreadsheetAddRow(oSpreadsheet, 'Title,Genre,BookDescription')> 
<cfset SpreadsheetAddRows(oSpreadsheet, getBooks)>
<!---<cfspreadsheet action="write" filename="#excelFilepath#" name="oSpreadsheet" overwrite=true>--->
<cfset fileWrite(excelFilepath, spreadsheetReadBinary(oSpreadsheet))>
