<cfscript>
a = {};
writeDump(a); 
writeOutput("<hr>");

writeOutput("isNull(): #isNull(a.b)#<hr>");

a.b = javacast("null", "");
writeOutput("isNull(): #isNull(a.b)#<hr>");
</cfscript>