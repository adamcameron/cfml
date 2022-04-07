<cfscript>
// nameWithAccessors.cfm
son = new Name();

son.first="Zachary";
son.last="Cameron Lynch";

writeOutput("First: #son.first#<br>");
writeOutput("Last: #son.last#<br>");

writeDump(var=son);

writeOutput("<hr>");

dad = new Name();

dad.setFirst("Adam");
dad.setLast("Cameron");

writeOutput("First: #dad.getFirst()#<br>");
writeOutput("Last: #dad.getLast()#<br>");

writeDump(var=dad);
</cfscript>
