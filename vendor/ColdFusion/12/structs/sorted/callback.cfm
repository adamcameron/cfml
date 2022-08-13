<cfscript>
sorted = structNew("sorted", function(e1,e2){
	return compare(e1,e2);
});
sorted.azure = "blue";
sorted.adze = "tool";
sorted.adam = "dork";
sorted.alabama = 3;

writeDump(sorted);
</cfscript>