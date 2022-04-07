<cfscript>
// name.cfm
name = new Name();

name.first="Zachary";
name.last="Cameron Lynch";

writeOutput("First: #name.first#<br>");
writeOutput("Last: #name.last#<br>");

writeDump(var=name);
</cfscript>
