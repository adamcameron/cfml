<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfscript>
	q1 = queryNew("Z,y");
	queryAddRow(q1);
	querySetCell(q1, "Z", "Q1 Col1 Rec 1 Value");
	queryAddRow(q1);
	querySetCell(q1, "y", "Q1 Col2 Rec 2 Value");
	queryAddRow(q1);
	queryAddRow(q1);
</cfscript>
<cfdump var="#q1#" label="q1">

<cfscript>
	colNames = q1.getColumnNames();
	q1.setColumnNames(listToArray("c1,c2"));
</cfscript>

<cfdump var="#q1#" label="q1">
<cfdump var="#colNames#" label="colNames">
[<cfdump var="#arrayToList(q1['c1'])#">]
<!---  --->
<pre>
<cfoutput>#cv.viewObject(queryNew(""))#</cfoutput>
</pre>


<cfsetting showdebugoutput="no">