<cfscript>
o = new C();

md = [];
writeOutput("<hr>tagOutputNotSpecified()<br>");
arrayAppend(md, o.tagOutputNotSpecified());

writeOutput("<hr>tagOutputTrue()<br>");
arrayAppend(md, o.tagOutputTrue());

writeOutput("<hr>tagOutputFalse()<br>");
arrayAppend(md, o.tagOutputFalse());

writeOutput("<hr>scriptOutputNotSpecified()<br>");
arrayAppend(md, o.scriptOutputNotSpecified());

writeOutput("<hr>scriptOutputFalse()<br>");
arrayAppend(md, o.scriptOutputFalse());

writeOutput("<hr>scriptOutputTrue()<br>");
arrayAppend(md, o.scriptOutputTrue());

writeOutput("<hr>");
writeDump(md);
	
</cfscript>