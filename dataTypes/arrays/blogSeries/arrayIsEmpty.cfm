<cfscript>
a = ["tahi", "rua", "toru", "wha"];
writeDump(a);
writeOutput("arrayIsEmpty: #arrayIsEmpty(a)#<br />");

arrayClear(a);
writeDump(a);
writeOutput("arrayIsEmpty: #arrayIsEmpty(a)#<br />");
</cfscript>