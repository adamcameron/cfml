<cfscript>
array function arraySetEach(required array array, required numeric from, required numeric to, required function callback){
	arrayset(array, from, to, "");
	for (var i=from; i <= to; i++){
		array[i] = callback(index=i, argumentCollection=arguments);
	}
	return array;
}

uuids = [];
arraySet(uuids, 1, 5, createUuid());
writeDump(uuids);

uuids = arraySetEach([], 1, 5, function(){
	return createUuid();
});
writeDump(uuids);

sequence = arraySetEach([], 1, 5, function(){
	return index;
});
writeDump(sequence);
writeOutput("<br>");
fromList = arraySetEach([], 1, 5, function(){
	return listGetAt("tahi,rua,toru,wha,rima", index);
});
writeDump(fromList);

sameStructs = [];
arraySet(sameStructs, 1, 5, {foo="moo"});
sameStructs[3].foo = "bar";

newStructs = arraySetEach([], 1, 5, function(){
	return {foo="moo"};
});
newStructs[3].foo = "bar";
writeDump([{sameStructs=sameStructs},{newStructs=newStructs}]);

</cfscript>