<cfscript>
a = {};
writeDump(a); 
writeOutput("<hr>");

writeOutput("#a.b ?: 'a.b was treated as null'#<hr>");

a.b = javacast("null", "");
writeOutput("#a.b ?: 'a.b was treated as null'#<hr>");
</cfscript>