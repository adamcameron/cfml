<cfscript>
// arrayAssignOperator.cfm
memoryAddress = createObject("java", "me.adamcameron.miscellany.MemoryAddress");

writeOutput("<hr>Create a1<br>");
a1 = [];
a1Address = memoryAddress.getAddress([a1]);
writeOutput("Address of a1: #a1Address#<br>");

writeOutput("<hr>Assign a1 to a2<br>");
a2 = a1;
a1Address = memoryAddress.getAddress([a1]);
writeOutput("Address of a1: #a1Address#<br>");
a2Address = memoryAddress.getAddress([a2]);
writeOutput("Address of a2: #a2Address#<br>");

writeOutput("<hr>Change a2<br>");
a2.append("a");
a1Address = memoryAddress.getAddress([a1]);
writeOutput("Address of a1: #a1Address#<br>");
a2Address = memoryAddress.getAddress([a2]);
writeOutput("Address of a2: #a2Address#<br>");

writeDump(a1);
</cfscript>