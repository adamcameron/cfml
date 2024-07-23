<cfscript>
// 3810965.cfm
numbers = ["tahi", "rua", "toru", "wha"];
numbers.filter(function(){
	writeDump(arguments);
	return true;
});
</cfscript>