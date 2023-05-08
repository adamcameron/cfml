<cfscript>
function arrayToUpperCase(array){
	return array.map(function(v){
		return v.ucase();
	});
}

rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Poropango","Papura"];
rainbowInUpperCase = arrayToUpperCase(rainbow);

writeDump(var=rainbow, label="rainbow");
writeDump(var=rainbowInUpperCase, label="rainbowInUpperCase");


// better still

rainbowInUpperCase = rainbow.map(function(v){
	return v.ucase();
});
writeDump(var=rainbow, label="rainbow");
writeDump(var=rainbowInUpperCase, label="rainbowInUpperCase");
</cfscript>