<cfscript>
original = ["Tahi","Rua","Toru","Wha","Rima","Ono","Whitu","Waru","Iwa","Tekau"];
writeDump(var=original, label="Original data");

new = arraySlice(original, 2, 3);
writeDump(var=new, label="2-4 (Rua-Wha)");

new = arraySlice(original, 4);
writeDump(var=new, label="4-10 (Wha-Tekau)");

new = arraySlice(original, -5, 3); 
writeDump(var=new, label="6-8 (Ono-Waru)");
</cfscript>