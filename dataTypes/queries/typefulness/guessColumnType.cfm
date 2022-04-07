<cfscript>
	q = queryNew("i,v,b", "Integer,VarChar,Bit");
	queryAddRow(q);
	querySetCell(q, "i", -1);
	querySetCell(q, "v", "string");
	querySetCell(q, "b", true);
</cfscript>

<table border="1">
<tr>
	<td>Column</td>
	<td>Type Code</td>
	<td>Type String</td>
</tr>
<cfoutput>
<cfloop from="1" to="#q.getColumnCount()#" index="x">
	<tr>
		<td>#q.getColumnName(javacast("int", x))#</td>
 		<td>#q.guessColumnType(javacast("int", x-1))#</td>
 		<td>#q.getColumnTypeName(javaCast("int", q.guessColumnType(javacast("int", x-1))))#</td>
	</tr>
</cfloop>
</cfoutput>
</table>
<cfdump var="#q['v'].toArray()#">