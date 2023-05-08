<cfflush interval="5">
<cfscript>
	q = queryNew("letter");
	for (i=1; i le 10; i=i+1){
		queryAddRow(q);
		querySetCell(q, "letter", chr(64+i));
	}

	writeOutput("BEFORE: q.currentRow: [#q.currentRow#]; q.recordCount: [#q.recordCount#]<br />");
	do{
		writeOutput("q.letter[q.currentRow] [#q.letter[q.currentRow]#]; q.currentRow: [#q.currentRow#]; q.recordCount: [#q.recordCount#]<br />");
		q.next();
	} while (q.currentRow neq 1);
	writeOutput("AFTER: q.currentRow: [#q.currentRow#]; q.recordCount: [#q.recordCount#]<br />");
</cfscript>

<cfoutput query="q">
	#letter#<br />
	<cfif letter eq "E">
		<cfset q.next()>
	</cfif>

</cfoutput>



<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<pre>
<cfoutput>#cv.viewObject(q)#</cfoutput>
</pre>
