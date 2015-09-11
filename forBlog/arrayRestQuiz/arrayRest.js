// arrayRest.js
var arrayRest = function(array){
	return array.reduce(function(result, element, index, array){
		var currentLastElement,next;
		if (result.length){
			currentLastElement = result.slice(-1)[0];
			next = currentLastElement.slice();
			next.shift();
		}else{
			next = array.slice();
		}
		result.push(next);
		return result;
	}, []);
};
module.exports = arrayRest;