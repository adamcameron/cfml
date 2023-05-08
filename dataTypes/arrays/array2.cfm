<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfscript>
	q1 = queryNew("q1Col1,q1Col2,Q2Col3,Q2Col4");
	queryAddRow(q1);
	querySetCell(q1, "q1Col1", "Q1 Col1 Rec 1 Value");
	queryAddRow(q1);
	querySetCell(q1, "q1Col2", "Q1 Col2 Rec 2 Value");
	queryAddRow(q1);
	queryAddRow(q1);
	a = q1.getColumn("q1Col1").toArray();

//	l1 = a.ArrayToList(a,",");
//	l2 = arrayToList(a);
	a2 = arrayNew(1);
	for (i=1; i le arrayLen(a); i=i+1){
		a2[i] = a[i];
	}
</cfscript>

<pre>
<cfoutput>
#cv.viewObject(a)#
<hr />
#cv.viewObject(a2)#
</cfoutput>
</pre>
<cfdump var="#a#"><br />
<!--- <cfdump var="#l1#"><br />

<cfset a[2] = "two">
<cfdump var="#l1#"><br />


<cfdump var="#l2#"><br />
<cfdump var="#a.indexOf('three')#"><br />

<cfsetting showdebugoutput="no"> --->