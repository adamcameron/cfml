<cfscript>
	ts = now();
	
	stFormat = {dataformat="yyy-mm-dd hh:mm:ss"};
	
	oSpreadsheet = spreadsheetNew();
	spreadsheetSetCellValue(oSpreadsheet, ts, 1, 1);
	spreadsheetSetCellValue(oSpreadsheet, date2Excel(ts), 1, 2);
	
	spreadsheetFormatCell(oSpreadsheet, stFormat, 1, 1);
	spreadsheetFormatCell(oSpreadsheet, stFormat, 1, 2);
	
	spreadsheetSetColumnWidth(oSpreadsheet, 2, 20);
	
	numeric function date2Excel(date d){
		var iDayPart = dateDiff("d", createDate(1899, 12, 30), arguments.d);
		var fTimePart = (hour(arguments.d) / 24) + (minute(arguments.d) / (24*60)) + (second(arguments.d) / (24*60*60));
		return iDayPart + fTimePart; 
	}
</cfscript>
<cfheader name="Content-Disposition" value="attachment; filename=dateTest_#timeFormat(now(), "HHMMSS")#.xls">
<cfcontent type="application/vnd-ms.excel" variable="#spreadsheetReadBinary(oSpreadsheet)#" reset="true">
