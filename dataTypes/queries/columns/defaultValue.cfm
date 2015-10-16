<cfscript>
q = queryNew("data");
q.addColumn("id", "integer", [1,2,3]);

writeOutput("#q.id[1]#: isNull(q.data[1]): #isNull(q.data[1])#<br>");
</cfscript>
<cfloop query="q">
	<cfoutput>#id#: isNull(data): #isNull(data)#<br></cfoutput>
</cfloop>