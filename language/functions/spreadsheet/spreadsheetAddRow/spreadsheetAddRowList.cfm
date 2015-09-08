<cfscript>
spreadsheet = spreadSheetNew();

data = "tahi,rua,toru,wha";
filePath = expandPath("./numbers.xls");

spreadsheet.addRow(data);

spreadsheet.write(filePath);

</cfscript>