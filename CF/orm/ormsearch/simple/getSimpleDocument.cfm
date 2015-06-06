<cfscript>
	iStart = getTickCount();
	aDocs = entityLoad("SimpleDocument", {}, "id asc");
	writeDump(var=aDocs, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>