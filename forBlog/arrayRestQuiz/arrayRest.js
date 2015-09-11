// arrayRest.js
var arrayRest = function(array){
	return array.reduce(function(result, element, index, array){
		var referenceToCurrentLastElement, nextElement;
		if (result.length){
			referenceToCurrentLastElement = result.slice(-1)[0];
			nextElement = referenceToCurrentLastElement.slice();
			nextElement.shift();
		}else{
			nextElement = array.slice();
		}
		result.push(nextElement);
		return result;
	}, []);
};

module.exports = arrayRest;