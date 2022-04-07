<cfscript>
	q1 = queryNew("col1");
	q2 = queryNew("col2");
	for (i=1; i le 5; i=i+1){
		queryAddRow(q1); querySetCell(q1, "col1", i);
		queryAddRow(q2); querySetCell(q2, "col2", i);
	}
</cfscript>

<cfdump var="#q1#" label="q1">
<cfdump var="#q2#" label="q2">

<cfoutput>

	<cfloop query="q1">
		outer loop q1.currentRow: [#q1.currentRow#]; q1.getCurrentRow() [#q1.getCurrentRow()#]; col1: [#q1.col1#];<br />
		outer loop q2.currentRow: [#q2.currentRow#]; q2.getCurrentRow() [#q2.getCurrentRow()#]; col2: [#q2.col2#]<br />
		<hr />
		<cfloop query="q2">
			inner loop q1.currentRow: [#q1.currentRow#]; q1.getCurrentRow() [#q1.getCurrentRow()#]; col1: [#q1.col1#]<br />
			inner loop q2.currentRow: [#q2.currentRow#]; q2.getCurrentRow() [#q2.getCurrentRow()#]; col2: [#q2.col2#]<br />
			<hr />
		</cfloop>
	</cfloop>

</cfoutput>