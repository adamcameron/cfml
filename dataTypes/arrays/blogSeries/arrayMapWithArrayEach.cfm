<cfscript>
original = [1,2,3,4];
multiplied = [];
arrayEach(original, function(e){
	arrayAppend(multiplied, e * 2);
});

writeDump(var=[original, multiplied]);
</cfscript>