<cfscript>
	param name="URL.name";
	
	iStart = getTickCount();
	a = ormSearch("firstName:#URL.name#", "Person");
	writeDump(var=a, label="Execution Time: #getTickCount()-iStart#ms");
	
	iStart = getTickCount();
	a = ormSearchOffline("firstName:#URL.name#", "Person", ["firstName","lastName"]);
	writeDump(var=a, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>