<cfscript>
	iStart = getTickCount();
	aDocs = entityLoad("Document", {}, "id asc");
	writeDump(var=aDocs, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>