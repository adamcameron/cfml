<cfscript>
// whenPassingToFunction.cfm

memoryAddress = createObject("java", "me.adamcameron.miscellany.MemoryAddress");

function showAddressForObject(object, originalAddress){
	var address = memoryAddress.getAddress([object]);
	var same = compare(originalAddress, address) ? "different" : "same";
	writeOutput("Address of argument: #address# (#same#)<br>");
}


writeOutput("<hr>Struct<br>");
o = {};
address = memoryAddress.getAddress([o]);
writeOutput("Address of object: #address#<br>");
showAddressForObject(o, address);

writeOutput("<hr>Array<br>");
o = [];
address = memoryAddress.getAddress([o]);
writeOutput("Address of object: #address#<br>");
showAddressForObject(o, address);

writeOutput("<hr>String<br>");
o = "";
address = memoryAddress.getAddress([o]);
writeOutput("Address of object: #address#<br>");
showAddressForObject(o, address);

writeOutput("<hr>Date<br>");
o = now();
address = memoryAddress.getAddress([o]);
writeOutput("Address of object: #address#<br>");
showAddressForObject(o, address);

writeOutput("<hr>Numeric<br>");
o = 2 * 2;
address = memoryAddress.getAddress([o]);
writeOutput("Address of object: #address#<br>");
showAddressForObject(o, address);

writeOutput("<hr>Boolean<br>");
o = !false;
address = memoryAddress.getAddress([o]);
writeOutput("Address of object: #address#<br>");
showAddressForObject(o, address);
</cfscript>
