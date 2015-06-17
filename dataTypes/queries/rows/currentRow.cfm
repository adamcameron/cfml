<cfscript>
	q = queryNew("c");
	writeOutput("After create: [#q.currentRow#]<br />");

	for (i=1; i le 10; i=i+1){
		queryAddRow(q); querySetCell(q, "c", i);
	}
	writeOutput("After loading: [#q.currentRow#]<br />");

	q.last();
	writeOutput("last(): [#q.currentRow#]<br />");

	q.previous();
	writeOutput("previous(): [#q.currentRow#]<br />");

	q.afterLast();
	writeOutput("afterLast(): [#q.currentRow#]<br />");

	q.beforeFirst();
	writeOutput("beforeFirst(): [#q.currentRow#]<br />");

	q.first();
	writeOutput("first(): [#q.currentRow#]<br />");

	q.next();
	writeOutput("next(): [#q.currentRow#]<br />");
</cfscript>