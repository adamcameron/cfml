// arrayRest.js
var arrayRest = function(array){
	return array.map(function(element,index,array){
		return array.slice(index);
	});
}

module.exports = arrayRest;