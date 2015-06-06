<cfscript>
	oX = spreadsheetNew("withArray");

	a = ["tahi", "rua", "toru,wha"];
	spreadsheetAddRows(oX, a, 1, 1);

	sXlsPath= expandPath("./withArray.xls");
	
	spreadsheetWrite(oX, sXlsPath, true);
</cfscript>

<cfheader name="content-disposition" value="attachment; filename=#getFileFromPath(sXlsPath)#">
<cfcontent file="#sXlsPath#" reset="true" type="application/spreadsheet">

