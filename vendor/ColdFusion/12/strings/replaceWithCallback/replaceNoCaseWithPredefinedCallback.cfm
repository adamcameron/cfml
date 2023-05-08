<cfscript>
replacer = function(){
	writeDump(arguments);
	return "replacement";
};
result = replaceNoCase("source to find match", "match", replacer);
writeDump(variables);
</cfscript>