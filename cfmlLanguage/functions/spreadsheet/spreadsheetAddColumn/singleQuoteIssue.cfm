<cfscript>
	q = queryNew("surname", "varchar");
	queryAddRow(q); querySetCell(q, "surname", "'something");

	oX = spreadsheetNew("surname");

	spreadsheetAddColumn(oX, valueList(q.surname));
	
	spreadsheetWrite(oX, "C:\temp\foo.xls");
</cfscript>
