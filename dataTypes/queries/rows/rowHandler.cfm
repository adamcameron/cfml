<cfscript>
	oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer");

	q = queryNew("col1,col2");
	queryAddRow(q);	querySetCell(q, "col1", "one");	querySetCell(q, "col2", "un");
	queryAddRow(q);	querySetCell(q, "col1", "two");	querySetCell(q, "col2", "deux");
	queryAddRow(q);	querySetCell(q, "col1", "three");	querySetCell(q, "col2", "trois");

	r = q.getRow(1);
	writeOutput(r.getColumn(1));
/*	i = r.valuesIterator();
	while (i.hasNext()){
		o = i.next();
		if (isDefined("o")){
			writeOutput(o.toString());
		}else{
			break;
		}
	}
*/
</cfscript>
<cfdump var="#r#">
<!--- <cfdump var="#i#"> --->
<cfoutput>
	<pre>
		#oCv.viewObject(r)#
	</pre>
</cfoutput>

<cfdump var="#r.getRowData()#">
