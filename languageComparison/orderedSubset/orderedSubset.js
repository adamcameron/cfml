// orderedSubset.js

set = {
	one : {
		alphabet : "a",
		maori : "tahi",
		roman : "i",
		ordinal : "first"
	},
	two : {
		alphabet : "b",
		maori : "rua",
		roman : "ii",
		ordinal : "second"
	},
	three : {
		alphabet : "c",
		maori : "toru",
		roman : "iii",
		ordinal : "third"
	},
	four : {
		alphabet : "d",
		maori : "wha",
		roman : "iv",
		ordinal : "fourth"
	}
};

subset = ["four", "two"];

function getOrderedSubset(set, subset){
	return subset.map(function(v,i){
		var element = set[v];
		element["label"]=v;
		return element;
	});
}


orderedSubset = getOrderedSubset(set, subset);
console.log(JSON.stringify(orderedSubset));

