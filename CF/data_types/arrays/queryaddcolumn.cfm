<cfscript>
	q = queryNew("col1,col2");
	queryAddRow(q);	querySetCell(q, "col1", "data");	querySetCell(q, "col2", "data");
	queryAddRow(q);	querySetCell(q, "col1", "data");	querySetCell(q, "col2", "data");
	queryAddRow(q);	querySetCell(q, "col1", "data");	querySetCell(q, "col2", "data");
	queryAddRow(q);	querySetCell(q, "col1", "data");	querySetCell(q, "col2", "data");
	queryAddRow(q);	querySetCell(q, "col1", "data");	querySetCell(q, "col2", "data");

	a = arrayNew(1);
	
	for (i=1; i le q.recordCount; i=i+1){
		arrayAppend(a, i);
	}
	queryAddColumn(q, "col3", a);
	
	s = structNew();
	s.status = false;
	s.value = q;
</cfscript>

<cfdump var="#s#">