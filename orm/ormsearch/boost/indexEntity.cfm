<cfscript>
	param name="URL.entity";
	iStart = getTickCount();
	ormIndex(URL.entity);
	writeOutput("Execution Time: #getTickCount()-iStart#ms");
</cfscript>