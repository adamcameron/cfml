<cfscript>
callback = function(){
	writeDump(arguments);
	return "replacement";
};
result = replaceNoCase("source", "match", callback);	

writeDump(variables);
</cfscript>