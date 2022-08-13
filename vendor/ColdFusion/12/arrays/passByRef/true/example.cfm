<cfscript>
function arrayToUpperCase(array){
	for (var i=1; i <= array.len(); i++){
		array[i] = array[i].ucase();
	}
	return array;
}

rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Poropango","Papura"];

rainbowInUpperCase = arrayToUpperCase(rainbow);

writeDump(var=rainbow, label="rainbow", format="text");
writeDump(var=rainbowInUpperCase, label="rainbowInUpperCase", format="text");

</cfscript>