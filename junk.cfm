<cfscript>
	regex = "[a-z&&[^qxz]]";
	string = "query";
	result = reFind(regex, string);
	writeDump(var=[result]);
</cfscript>