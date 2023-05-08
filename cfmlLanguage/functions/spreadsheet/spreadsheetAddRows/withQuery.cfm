<cfscript>
spreadsheet = spreadsheetNew();
data = queryNew("values",  "varchar", [["tahi"], ["rua"], ["toru,wha"], ["rima,ono"]]);
filePath= expandPath("./withQuery.xls");

spreadsheet.addRows(data,1,1);
spreadsheet.write(filePath, true);

</cfscript>

