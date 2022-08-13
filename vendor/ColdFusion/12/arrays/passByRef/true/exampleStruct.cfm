<cfscript>
function structToUpperCase(struct){
	for (var key in struct){
		struct[key] = struct[key].ucase();
	}
	return struct;
}

rainbow	= {red="Whero", orange="Karaka", yellow="Kowhai", green="Kakariki", blue="Kikorangi", indigo="Poropango", purple="Papura"};

rainbowInUpperCase = structToUpperCase(rainbow);

writeDump(var=rainbow, label="rainbow", format="text");
writeDump(var=rainbowInUpperCase, label="rainbowInUpperCase", format="text");
</cfscript>