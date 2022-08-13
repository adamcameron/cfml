<cfscript>
callback = function(){
	writeDump(arguments);
	return "replacement";
};
result = replaceNoCase("source", "match", {});	

writeDump(variables);
</cfscript>