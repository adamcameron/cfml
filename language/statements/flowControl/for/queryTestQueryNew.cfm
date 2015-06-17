<cfscript>
	q = queryNew("c");
	queryAddRow(q);
	querySetCell(q, "c", {a=1});
	queryAddRow(q);
	querySetCell(q, "c", {a=1});
	for (st in q){
		writeDump(st)
	}
	writeDump(q)
</cfscript>
