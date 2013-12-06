<cfscript>
	writeOutput("<table><tr>");
a = ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru"];
writeOutput("<td>");
writeDump(a);
writeOutput("</td>");



// now get rid of the first five elements
for (i=1; i <=5; i++){
	arrayDeleteAt(a, 1);
}
writeOutput("<td>");
writeDump(a);
writeOutput("</td>");
</cfscript>