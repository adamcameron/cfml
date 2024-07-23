<cfscript>
spreadsheet = spreadsheetNew();
data = [
	["tahi"],
	["rua"],
	["toru,wha"],	// this is one data value
	["rima,ono"] // so is this
];
filePath= expandPath("./withArray.xls");

spreadsheet.addRows(data,1,1);
spreadsheet.write(filePath, true);
</cfscript>

