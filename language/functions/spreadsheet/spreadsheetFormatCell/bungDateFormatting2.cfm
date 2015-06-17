<cfscript>
	ts = now();
	
	stFormat = {dataformat="yyy-mm-dd hh:mm:ss"};
	
	
	q = queryNew("");
	queryAddColumn(q, "asDate", "Date", [now(), createDate(2011,3,24), createDate(2009,12,5)]);
	queryAddColumn(q, "asNumeric", "Double" , [date2Excel(now()), date2Excel(createDate(2011,3,24)), date2Excel(createDate(2009,12,5))]);
	queryAddColumn(q, "unformatted", "Double" , [date2Excel(now()), date2Excel(createDate(2011,3,24)), date2Excel(createDate(2009,12,5))]);
	
	oSpreadsheet = spreadsheetNew();
	spreadsheetAddRows(oSpreadsheet, q);
	
	spreadsheetFormatColumn(oSpreadsheet, stFormat, 1);
	spreadsheetFormatColumn(oSpreadsheet, stFormat, 2);
	
	spreadsheetSetColumnWidth(oSpreadsheet, 1, 20);
	spreadsheetSetColumnWidth(oSpreadsheet, 2, 20);
	
	numeric function date2Excel(date d){
		var iDayPart = dateDiff("d", createDate(1899, 12, 30), arguments.d);
		var fTimePart = (hour(arguments.d) / 24) + (minute(arguments.d) / (24*60)) + (second(arguments.d) / (24*60*60));
		return iDayPart + fTimePart; 
	}
</cfscript>
<cfheader name="Content-Disposition" value="attachment; filename=dateTest_#timeFormat(now(), "HHMMSS")#.xls">
<cfcontent type="application/vnd-ms.excel" variable="#spreadsheetReadBinary(oSpreadsheet)#" reset="true">
