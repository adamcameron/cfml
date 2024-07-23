<cfscript>
	param name="name";
	iStart = getTickCount();
	aPeople = entityLoad("Person", {firstName="#URL.name#"}, "lastname desc");
	writeDump(var=aPeople, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>