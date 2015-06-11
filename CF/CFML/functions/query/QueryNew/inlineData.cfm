<cfscript>
	q = queryNew("id,name","Integer,Varchar", [{id=1}, {name="Three"}]);
	queryAddRow(q, [{id=2, name="two"}, {id=4, name="four"}]);
	writeDump(q);
</cfscript>