<cfscript>
	param name="URL.keyword" type="regex" pattern="^(?i)[a-z]+$";
	
	iStart = getTickCount();
	a = ormSearch("doc:#URL.keyword#", "Document");
	writeDump(var=a, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>