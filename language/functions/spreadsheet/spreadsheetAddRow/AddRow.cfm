<cfscript>
	oX		= excelNew("Test New");

	excelAddRow(ox, "one,two,three,four,five");
	excelAddRow(ox, "six,seven,eight,nine,ten", 6, 7);
	excelAddRow(ox, "apple,,cherry,date,,fig");

	sXlsPath= expandPath("./testAddRow.xls");
	sCsvPath= expandPath("./testAddRow.csv");

	cfExcel(action="write", filename=sCsvPath, name="oX", overwrite=true, format="csv");
	cfExcel(action="write", filename=sXlsPath, name="oX", overwrite=true);
</cfscript>

<cffunction name="cfExcel">
	<cfexcel attributecollection="#arguments#">
</cffunction>