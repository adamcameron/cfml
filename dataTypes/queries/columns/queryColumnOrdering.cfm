<cfscript>
	cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
	
	q = queryNew("c,b,a");
	queryAddRow(q);	querySetCell(q, "c", 3);	querySetCell(q, "b", 2);	querySetCell(q, "a", 1);	
	queryAddRow(q);	querySetCell(q, "c", 6);	querySetCell(q, "b", 5);	querySetCell(q, "a", 4);	
</cfscript>
<cfdump var="#q#">
<cfoutput>
q.columnList: #q.columnList#<br />
<pre>

#cv.viewObject(queryNew(''))#
</pre>
</cfoutput>

<cfdump var="#q.getColumnList()#">

<cfsetting showdebugoutput="no">