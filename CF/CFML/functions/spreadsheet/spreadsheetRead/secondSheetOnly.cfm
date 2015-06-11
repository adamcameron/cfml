<cfscript>
	sFile = expandPath("./threeSheet.xls");
	oXlsSheet1 = spreadSheetRead(sFile, "Sheet1");
	oXlsSheet2 = spreadSheetRead(sFile, "Sheet2");
	oXlsSheet3 = spreadSheetRead(sFile, "Sheet3");

	spreadsheetRemoveSheet(oXlsSheet1, "Sheet2");
	spreadsheetRemoveSheet(oXlsSheet1, "Sheet3");
	spreadsheetWrite(oXlsSheet1, expandPath("./sheet1.xls"), true);	

	spreadsheetRemoveSheet(oXlsSheet2, "Sheet1");
	spreadsheetRemoveSheet(oXlsSheet2, "Sheet3");
	spreadsheetWrite(oXlsSheet2, expandPath("./sheet2.xls"), true);	

	spreadsheetRemoveSheet(oXlsSheet3, "Sheet1");
	spreadsheetRemoveSheet(oXlsSheet3, "Sheet2");
	spreadsheetWrite(oXlsSheet3, expandPath("./sheet3.xls"), true);	
</cfscript>