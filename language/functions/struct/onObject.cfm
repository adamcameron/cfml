<cfscript>
o = new C();

structInsert(o, "viaStructInsert", "inserted");
writeDump(var=o);
writeOutput("<hr>");

structEach(o, function(){
	writeDump(var=arguments);
});
writeOutput("<hr>");

filtered = structFilter(o, function(k,v){
	return isCustomFunction(v);
});
writeDump(var=filtered);
writeOutput("<hr>");

writeOutput("structCount(): #structCount(o)#<br>");
writeOutput("<hr>");

structAppend(o, {
	keyAddedViaStructAppend = true
});
writeDump(var=o);
writeOutput("<hr>");

writeDump(var=structFindValue(o, "inserted", "ALL"), label="structFindValue()");
writeOutput("<hr>");

</cfscript>