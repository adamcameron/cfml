<cfscript>
q = queryNew("col");
for (i=1; i le 10; i=i+1){
	queryAddRow(q);
	querySetCell(q, "col", chr(64+i));
}

o = createObject("component", "c1");
q2 = o.f1(q);
writeOutput(q2.currentRow);
</cfscript>
