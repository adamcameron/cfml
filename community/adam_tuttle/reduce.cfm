<cfscript>
//reduce.cfm
letters = [
	["a", "b", "c", "d", "e"],
	["b", "c", "d", "e"],
	["a", "b", "c"]
];

result = letters.reduce(function(reduction, current, index){
	if (index==1) return reduction;
	return current.filter(function(element){
		return reduction.contains(element);
	});
}, letters[1]);
writeDump(result);
</cfscript>