<cfscript>
	iStart = getTickCount();
	aDocs = entityLoad("AutoIndexableDocument", {}, "id asc");
	writeDump(var=aDocs, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>