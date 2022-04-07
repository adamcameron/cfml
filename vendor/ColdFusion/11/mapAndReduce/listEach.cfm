<cfscript>
// listEach.cfm
list = "1,2,3,4";
listEach(list, function(v){
	writeDump(arguments);
});
</cfscript>