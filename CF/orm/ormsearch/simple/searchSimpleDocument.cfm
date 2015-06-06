<cfscript>
	param name="URL.keyword";
	
	iStart = getTickCount();
	a = ormSearch("doc:#URL.keyword#", "SimpleDocument");
	writeDump(var=a, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>