<cfscript>
result = replaceNoCase("source to find match", "match", function(){
	writeDump(arguments);
	return "replacement";
});	
</cfscript>