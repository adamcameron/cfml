<cfscript>
callback = function(){
	writeDump(arguments);
	return "replacement";
};
result = replaceNoCase("source", "match", function(){
	writeDump(arguments);
	return "replacement";
});	

writeDump(variables);
</cfscript>