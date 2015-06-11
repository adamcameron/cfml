<cfscript>
	q = queryNew("");
	queryAddColumn(q,"data", "VarChar" ,["ABCDE", "12345", "01234", "0A123", "0B123", "1E2", "1#chr(9)#E2", "0#chr(9)#E123", "0E123", "1E234"]);

	oSpreadsheet = spreadsheetNew("sheet1");
	spreadsheetFormatColumn(oSpreadsheet, {dataformat="General"}, 1);
	spreadsheetAddRows(oSpreadsheet, q, 1);
	spreadsheetFormatColumn(oSpreadsheet, {dataformat="General"}, 1);
	spreadsheetWrite(oSpreadsheet, "C:\temp\#createUUID()#.xls");
</cfscript>
<cfoutput>#1E2+1#</cfoutput>