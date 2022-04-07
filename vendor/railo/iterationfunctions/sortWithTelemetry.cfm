<cfscript>
numbers = [7,5,3,1,2,4,6,8];

iterations = [];
couplets = {};
arraySort(numbers, function(v1,v2){
	var coupletKey = "#v1#:#v2#";
	if (!structKeyExists(couplets, coupletKey)){
		couplets[coupletKey] = 0;
	}
	couplets[coupletKey]++;
	arrayAppend(iterations, coupletKey);
	return sgn(v1 - v2);
});
writeDump(couplets);
writeDump(iterations);



writeOutput("<hr>");
</cfscript>