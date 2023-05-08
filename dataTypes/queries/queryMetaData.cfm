<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfscript>
	q1 = queryNew("Q2Col4,Q2Col3,q1Col2,q1Col1");
	queryAddRow(q1);
	querySetCell(q1, "q1Col1", "Q1 Col1 Rec 1 Value");
	queryAddRow(q1);
	querySetCell(q1, "q1Col2", "Q1 Col2 Rec 2 Value");
	queryAddRow(q1);
	queryAddRow(q1);

</cfscript>

<cfdump var="#q1#" label="q1">
<cfdump var="#q1.getMetaData().getColumnLabels()#">
<pre>
<h5>query.GetMetaData()</h5>
<cfoutput>#cv.viewObject(q1.getMetaData())#</cfoutput>
</pre>
<hr />
<pre>
<h5>queryNew("")</h5>
<cfoutput>#cv.viewObject(queryNew(""))#</cfoutput>
</pre>



<cfsetting showdebugoutput="no">