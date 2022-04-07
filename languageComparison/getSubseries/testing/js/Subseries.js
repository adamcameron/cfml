// Subseries.js

function Subseries() {
}

Subseries.prototype.getSubseries = function(series, threshold){
	var working = [];
	var sum = this.sum;
	return series.reduce(function(reduction, current){
		working.push(current)
		while (sum(working) > threshold){
			working.shift();
		}
		var workingIsBetterForLength	= working.length > reduction.length
		var workingIsBetterForTotal		= working.length == reduction.length && sum(working) > sum(reduction)
		return (workingIsBetterForLength || workingIsBetterForTotal) ? working.slice() : reduction
	}, []);
};

Subseries.prototype.sum = function(array){
	return array.reduce(function(carry,addend){
		return carry + addend;
	}, 0);
};