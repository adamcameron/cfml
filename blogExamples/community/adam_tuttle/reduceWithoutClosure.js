// reduceWithoutClosure.js
letters = [
	["a", "b", "c", "d", "e"],
	["b", "c", "d", "e"],
	["a", "b", "c"]
];


function filterHandler(element){
	return reduction.indexof(element) >= 0;
};

function reductionHandler(reduction, current, index){
	if (index==0) return reduction;
	return current.filter(filterHandler);
}

result = letters.reduce(reductionHandler, letters[0]);