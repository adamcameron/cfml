<cfscript>
original = [];
original[1] = "Tahi";
original[3] = "Toru";
original[5] = "Rima";
original[7] = "Whitu";
original[9] = "Iwa";
original[11] = "tekau ma tahi";
arrayDeleteAt(original, 11);	// leaves the last element, 10, empty

writeDump(var=original, label="Original data");

new = arraySlice(original, 2, 3);
writeDump(var=new, label="Rua-Wha");

new = arraySlice(original, 4);
writeDump(var=new, label="Wha-Tekau");

new = arraySlice(original, -5, 3); 
writeDump(var=new, label="Ono-Waru");
</cfscript>