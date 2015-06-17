// reduce.js
letters = [
	["a", "b", "c", "d", "e"],
	["b", "c", "d", "e"],
	["a", "b", "c"]
];

result = letters.reduce(function(reduction, current, index){
	if (index==0) return reduction;
	return current.filter(function(element){
		return reduction.indexOf(element) >= 0;
	});
}, letters[0]);
console.dir(result);