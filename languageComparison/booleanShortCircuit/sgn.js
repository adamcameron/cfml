operands = [-1,0,1];

operands.forEach(function(a){
	operands.forEach(function(b){
		console.log(a + " || " + b + " = " + (a || b));
	});
});
