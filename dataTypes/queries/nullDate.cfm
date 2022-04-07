<cfscript>
	q1 = queryNew("iCol,sCol,dCol", "CF_SQL_INTEGER,CF_SQL_VARCHAR,CF_SQL_TIMESTAMP");
	for (i=1; i <= 10; i++){
		queryAddRow(q1);
		querySetCell(q1, "iCol", i);
		querySetCell(q1, "sCol", repeatString(chr(64+i), i));
		querySetCell(q1, "dCol", dateAdd("d", i, now()));
	}

	q2 = queryNew("iCol,sCol", "CF_SQL_INTEGER,CF_SQL_VARCHAR");
	for (i=11; i <= 20; i++){
		queryAddRow(q1);
		querySetCell(q1, "iCol", i);
		querySetCell(q1, "sCol", repeatString(chr(64+i), i));
	}

</cfscript>
<cfquery name="q3" dbtype="query">
	select	iCol, sCol, dCol
	from	q1
	union all
	select	iCol, sCol, cast('' as TIMESTAMP)
	from	q2
</cfquery>
<cfdump var="#q3#">