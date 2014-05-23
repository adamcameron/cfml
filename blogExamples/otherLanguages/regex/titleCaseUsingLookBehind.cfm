<cfscript>
	string = "a.christopher lynch-smith";
	result = reReplaceNoCase(string, "(^|[-. ])(\w)", "\1\u\2", "ALL");

	
	writeDump([result]);

</cfscript>