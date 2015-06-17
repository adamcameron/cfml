<cfscript>
a = {};
writeDump(a); 
writeOutput("<hr>");
try {
	writeDump(a.b);
}catch(any e){
	writeOutput("#e.type# exception: #e.message# #e.detail#");
}
writeOutput("<hr>");
try {
	a.b = javacast("null", "");
	writeDump(a);
}catch(any e){
	writeOutput("#e.type# exception: #e.message# #e.detail#");
}
writeOutput("<hr>");
</cfscript>