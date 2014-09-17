<cfscript>
// references.cfm

original = "tahi,rua,toru";
reference = original;

original &= ",wha";
reference &= ",rima";

writeOutput("original: #original#<br>reference: #reference#<br>");
writeOutput("<hr>");

original = {"red"="whero", "orange"="karaka", "yellow"="kowhai"};
reference = original;

original["green"] = "kakariki";
original["blue"] = "kikorangi";

writeDump(original);
writeDump(reference);
writeOutput("<hr>");

reference = "and now for something completely different";
writeDump([original,reference]);
writeOutput("<hr>");
</cfscript>