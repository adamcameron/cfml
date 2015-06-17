<cfscript>
	any function f(){
		var q = queryNew("c");
		var c = closure(){
			return q;
		};

		queryAddRow(q);
		querySetCell(q, "c", {a=1});
		queryAddRow(q);
		querySetCell(q, "c", {a=1});
		
		return c;
	}
	for (st in f()){
		writeDump(st)
	}
	writeDump(q)
</cfscript>