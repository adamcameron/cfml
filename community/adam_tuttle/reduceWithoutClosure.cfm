<cfscript>
// reduceWithoutClosure.cfm
letters = [
	["a", "b", "c", "d", "e"],
	["b", "c", "d", "e"],
	["a", "b", "c"]
];

function filterHandler(element){
	return reduction.contains(element);
}

function reductionHandler(reduction, current, index){
	// variables.reduction = reduction; //cheat
	if (index==1) return reduction;
	return current.filter(filterHandler);
}

result = letters.reduce(reductionHandler, letters[1]);
writeDump(result);
</cfscript>