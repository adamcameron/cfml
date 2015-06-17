<cfscript>
// arrayEach.cfm
letters = ["a","b","c","d"];
arrayEach(letters, function(v,i){
	writeDump(arguments);
});
</cfscript>