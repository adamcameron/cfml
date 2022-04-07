<cfscript>
// enhancedName.cfm
name = new EnhancedName();

name.first="Zachary";
name.last="Cameron Lynch";

writeOutput("First: #name.first#<br>");
writeOutput("Last: #name.last#<br>");

writeDump(var=name);
</cfscript>
