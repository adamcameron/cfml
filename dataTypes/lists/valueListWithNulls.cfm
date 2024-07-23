<cfscript>
	q = queryNew("c");
	for (i=1; i le 10; i=i+1){
		queryAddRow(q);
		queryAddRow(q);
		querySetCell(q, "c", createUUID());
		queryAddRow(q);
	}
	l1 = valueList(q.c);
	l2 = replace(l1, ",(,+)", ",0\1", "ALL");
	l2 = REReplace(l2, "^,", "0,");
	l2 = REReplace(l2, ",$", ",0");
</cfscript>
<cfdump var="#q#">
<cfdump var="#l1#">
<cfdump var="#l2#">