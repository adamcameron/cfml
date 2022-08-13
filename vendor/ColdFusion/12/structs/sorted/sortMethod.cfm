<cfscript>
	writeOutput("hi");
	
normal = ["blue", "tool", "dork", 3];

sorted = normal.sort(function(){
	writeDump(arguments);abort;
});


writeDump(sorted);
</cfscript>