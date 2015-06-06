<cfscript>
	q = queryNew("id,productCode", "integer,varchar");
	for (i=1; i <= 5; i++){
		queryAddRow(q); querySetCell(q, "id", i); querySetCell(q, "productCode", "000#i#");
	}

	oX = spreadsheetNew("Test New");

	aCols = getMetadata(q);
	lCols = "";
	for (i=1; i <= arrayLen(aCols); i++){
		lCols = listAppend(lCols, aCols[i].name);
	}
	spreadsheetAddColumn(oX, valueList(q.productCode));
	spreadsheetFormatColumn(oX, {dataformat="0000"}, 1);
	//spreadsheetAddRows(oX, q);

	sXlsPath= expandPath("./testAddRows.xls");
	
	spreadsheetWrite(oX, sXlsPath, true);
</cfscript>

<!---<cfdump var="#q#">
<cfform>
<cfgrid name="grd1" query="q" format="html">
	<cfgridcolumn name="id" type="numeric">
	<cfgridcolumn name="productCode" type="string_nocase">
</cfgrid>

<cfgrid name="grd1" query="q" format="flash">
	<cfgridcolumn name="id" type="numeric">
	<cfgridcolumn name="productCode" type="string_nocase">
</cfgrid>
</cfform>
--->
<cfheader name="content-disposition" value="attachment; filename=#getFileFromPath(sXlsPath)#">
<cfcontent file="#sXlsPath#" reset="true" type="application/spreadsheet">

