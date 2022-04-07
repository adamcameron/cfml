<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfscript>
	q1 = queryNew("q1Col1,q1Col2,Q2Col3,Q2Col4");
	queryAddRow(q1);	querySetCell(q1, "q1Col1", "Q1 Col1 Rec 1 Value");
	queryAddRow(q1);	querySetCell(q1, "q1Col2", "Q1 Col2 Rec 2 Value");
	queryAddRow(q1);
	queryAddRow(q1);
	dump(var=q1, label="q1 before: #q1.columnList#");

	q2 = queryNew("Q2Col3,Q2Col4");
	queryAddRow(q2);	querySetCell(q2, "Q2Col3", "Q2 Col3 Rec 1 Value");
	queryAddRow(q2);	querySetCell(q2, "Q2Col4", "Q2 Col4 Rec 2 Value");
	dump(var=q2, label="q2 before: #q2.columnList#");

	q1.populate(q2, 3);
	dump(var=q1, label="q1 after: #q1.columnList#");
</cfscript>
