<cfspreadsheet action="read" src="#expandPath('./Book1.xls')#" name="oExcel">

<cfset cell.A9 = spreadsheetGetCellValue(oExcel, 9, 1)>
<cfset cell.A10 = spreadsheetGetCellValue(oExcel, 10, 1)>
<cfset cell.A11 = spreadsheetGetCellValue(oExcel, 11, 1)>
<cfset cell.A12 = spreadsheetGetCellValue(oExcel, 12, 1)>
<cfdump var="#cell#">