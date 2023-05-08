<cfscript>
[1,2,3].map(function(){
	dump(arguments);
	abort;
})	
</cfscript>