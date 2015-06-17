<cfscript>
//firstClass.cfm
numbers = "tahi,rua,toru,wha";
lengths = [];
numbers.each(function(v){
	arrayAppend(lengths,v.len());
});
writeDump(variables);
</cfscript>