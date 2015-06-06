<cfscript>
	q1 = queryNew("iCol,sCol");
	for (i=1; i le 5; i=i+1){
		queryAddRow(q1);
		querySetCell(q1, "iCol",  i);
		querySetCell(q1, "sCol", chr(96+i));
	}

	addCol(q1, "newCol");

	function addCol(query, colName){
		var i = 0;
		var q = arguments.query;
		queryAddColumn(q, arguments.colName, arrayNew(1));
		for (i=1; i le q.recordCount; i=i+1){
			q[arguments.colName][i] = i;
		}
		return q;
	}

</cfscript>
<cfdump var="#q1#" label="q1">
<cfdump var="#getMetaData(q1)#" label="getMetaData(q1)">


<cfscript>
	qRef = queryNew("id,label");
	queryAddRow(qRef);
	querySetCell(qRef, "id",  3);
	querySetCell(qRef, "label", "See");
</cfscript>


<cfquery name="q3" dbtype="query">
	select	iCol, sCol, label
	from	q1, qRef
	where	q1.newCol = qRef.id
	order by newCol
</cfquery>
<cfdump var="#q3#" label="q3">
<cfdump var="#getMetaData(q3)#" label="#q3.columnList#">