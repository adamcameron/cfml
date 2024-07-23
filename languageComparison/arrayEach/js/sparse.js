rainbow = [];
rainbow[1] = "Whero";
// no [2]
rainbow[3] = "Kowhai";
// no [4]
rainbow[5] = "Kikorangi";
// no [6]
rainbow[7] = "Mawhero";

callCounter = 0;
rainbow.forEach(
	function(v,i,a){
		callCounter++;
		console.log("Called for [" + i + "]: " + v);
	}
);
console.log("callback was called: " + callCounter + " times");