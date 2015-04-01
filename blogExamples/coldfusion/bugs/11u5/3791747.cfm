<cfscript>
// 3791747.cfm
iterateArgs = function(){
	arguments.each(function(){
		writeDump(var=arguments);
	});
};

iterateArgs("tahi", "rua", "toru", "wha");	
</cfscript>