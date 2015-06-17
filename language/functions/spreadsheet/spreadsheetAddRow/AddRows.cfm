<cfquery name="qRows" datasource="intranet" maxrows="20" result="stRows">
	select	*
	from	(
		select		uuid, page_title, page_ssurl, page_template, date_created, last_updated
		from		pages
		order by	page_title
	)
	where	rownum <= 20
</cfquery>

<cfscript>
	oX		= excelNew("Test New");

	aCols = getMetadata(qRows);
	lCols = "";
	for (i=1; i <= arrayLen(aCols); i++){
		lCols = listAppend(lCols, aCols[i].name);
	}
	excelAddRow(oX, lCols);
//	excelAddRows(oX, qRows); // works
 	excelAddRows(oX, qRows, 2); // doesn't
//	excelAddRows(oX, qRows, 2, 1); // works

	excelAddColumn(oX, "FRIENDLY NAME," & quotedValueList(qRows.page_title), 1, 1, true);	// should be able to specify a query column

	sXlsPath= expandPath("./testAddRows.xls");
	cfExcel(action="write", filename=sXlsPath, name="oX", overwrite=true);
</cfscript>
<cfheader name="content-disposition" value="inline; filename=#getFileFromPath(sXlsPath)#">
<cfcontent file="#sXlsPath#" reset="true" type="application/excel">

<cffunction name="cfExcel">
	<cfexcel attributecollection="#arguments#">
</cffunction>