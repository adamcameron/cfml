<cfscript>
// structEach.cfm
numbers = {one="tahi",two="rua",three="toru",four="wha"};
structEach(numbers, function(){
	writeDump(arguments);
});
</cfscript>