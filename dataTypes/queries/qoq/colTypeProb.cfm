<cfscript>
	q1 = queryNew("iCol,sCol", "Integer,VarChar");
	for (i=1; i <= 5; i++){
		queryAddRow(q1);
		querySetCell(q1, "iCol", i);
		querySetCell(q1, "sCol", chr(96+i));
	}
</cfscript>
<cfdump var="#q1#" label="q1">
<cfdump var="#getMetaData(q1)#" label="getMetaData(q1)">


<cfscript>
	q2 = queryNew("iCol,sCol", "Integer,VarChar");
	for (i=1; i <= 5; i++){
		queryAddRow(q2);
		querySetCell(q2, "iCol", i);
		querySetCell(q2, "sCol", chr(96+i));
	}
</cfscript>
<cfdump var="#q2#" label="q2">
<cfdump var="#getMetaData(q2)#" label="getMetaData(q2)">


<cfquery name="q3" dbtype="query">
	select	*
	from	q1, q2
	where	q1.iCol = q2.iCol
</cfquery>
