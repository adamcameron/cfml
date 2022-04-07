<cfscript>
	query function f(){
		var q = queryNew("c");
		queryAddRow(q);
		querySetCell(q, "c", {a=1});
		queryAddRow(q);
		querySetCell(q, "c", {a=1});
		
		return q;
	}
	for (st in f()){
		writeDump(st)
	}
	writeDump(q)
</cfscript>