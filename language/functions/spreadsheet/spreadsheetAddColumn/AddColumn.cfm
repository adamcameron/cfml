<cfscript>
	oX		= excelNew();

	q = queryNew("type,items");
	queryAddRow(q); querySetCell(q, "type", "fruit"); querySetCell(q, "items", "apple,banana");
	queryAddRow(q); querySetCell(q, "type", "people"); querySetCell(q, "items", "charlie,donna");	// see single-quotes here
	queryAddRow(q); querySetCell(q, "type", "colours"); querySetCell(q, "items", "red,green,blue");

//	excelAddColumn(oX, valueList(q.type));	// works
	excelAddColumn(oX, valueList(q.items));	// errors

	sXlsPath= expandPath("./addColumn.xls");
</cfscript>
<cfexcel action="write" filename="#sXlsPath#" name="oX" overwrite="true">
<cfheader name="content-disposition" value="inline; filename=#getFileFromPath(sXlsPath)#">
<cfcontent file="#sXlsPath#" reset="true" type="application/excel">
