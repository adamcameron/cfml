<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfscript>
	q1 = queryNew("q1Col1,q1Col2,Q2Col3,Q2Col4");
	queryAddRow(q1);
	querySetCell(q1, "q1Col1", "Q1 Col1 Rec 1 Value");
	queryAddRow(q1);
	querySetCell(q1, "q1Col2", "Q1 Col2 Rec 2 Value");
	queryAddRow(q1);
	queryAddRow(q1);

</cfscript>

<pre>
<cfset a = q1.getColumn('q1Col2').toArray()>
<cfdump var="#a#">
<cfoutput>
#cv.viewObject(a)#

#cv.viewObject(q1)#
</cfoutput>
</pre>



<cfsetting showdebugoutput="no">