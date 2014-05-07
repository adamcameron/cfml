<cfscript>
numbers = {one="tahi", two="rua"};
result = numbers.filter(function(){
	writeDump(arguments);
});
</cfscript>