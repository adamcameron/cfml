<cfscript>
// structAssignOperator.cfm
memoryAddress = createObject("java", "me.adamcameron.miscellany.MemoryAddress");

writeOutput("<hr>Create st1<br>");
st1 = {};
st1Address = memoryAddress.getAddress([st1]);
writeOutput("Address of st1: #st1Address#<br>");

writeOutput("<hr>Assign st1 to st2<br>");
st2 = st1;
st1Address = memoryAddress.getAddress([st1]);
writeOutput("Address of st1: #st1Address#<br>");
st2Address = memoryAddress.getAddress([st2]);
writeOutput("Address of st2: #st2Address#<br>");

writeOutput("<hr>Change st2<br>");
st2.key = "value";
st1Address = memoryAddress.getAddress([st1]);
writeOutput("Address of st1: #st1Address#<br>");
st2Address = memoryAddress.getAddress([st2]);
writeOutput("Address of st2: #st2Address#<br>");

writeDump(st1);
</cfscript>