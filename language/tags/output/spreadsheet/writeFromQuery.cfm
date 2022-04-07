<cfscript>
	q = queryNew("iCol,sCol,dCol", "CF_SQL_INTEGER,CF_SQL_VARCHAR,CF_SQL_TIMESTAMP");
	queryAddRow(q); querySetCell(q,"iCol", 1); querySetCell(q, "sCol", "Donald"); querySetCell(q, "dCol", createDateTime(1933,2,20,1,2,3));
	queryAddRow(q); querySetCell(q,"iCol", 2); querySetCell(q, "sCol", "Val"); querySetCell(q, "dCol", createDateTime(1933,11,6,4,5,6));
	queryAddRow(q); querySetCell(q,"iCol", 3); querySetCell(q, "sCol", "Mark"); querySetCell(q, "dCol", createDateTime(1959,9,1,7,8,9));
	queryAddRow(q); querySetCell(q,"iCol", 4); querySetCell(q, "sCol", "Fiona"); querySetCell(q, "dCol", createDateTime(1961,7,12,0,1,2));
	queryAddRow(q); querySetCell(q,"iCol", 5); querySetCell(q, "sCol", "Adam"); querySetCell(q, "dCol", createDateTime(1970,2,17,3,4,5));

	stArgs			= structNew();
	stArgs.action	= "write";
	stArgs.fileName	= getDirectoryFromPath(getCurrentTemplatePath()) & "test.xls";
	stArgs.query	= "q";
	stArgs.action	= "write";
	stArgs.sheet	= 1;
	stArgs.sheetname= "Cameron";
</cfscript>
<cfexcel attributecollection="#stArgs#">
