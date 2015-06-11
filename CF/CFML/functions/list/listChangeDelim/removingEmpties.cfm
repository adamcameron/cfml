<cfscript>
	q = queryNew("id,data", "Integer,VarChar");
	for (i=1; i le 10; i=i+1){
		queryAddRow(q);
		querySetCell(q, "id", i);
		if (i mod 2){
			querySetCell(q, "data", chr(i+64));
		}
	}
	l1 = valueList(q.data);
	l2 = listChangeDelims(l1, ",");
</cfscript>
<cfdump var="#variables#">