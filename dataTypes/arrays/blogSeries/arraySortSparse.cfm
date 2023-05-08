<cfscript>
a = ["tahi", {}, "toru"];
try {
	arraySort(a, "text");
	writeDump(a);
}
catch (any e){
	writeDump(e);
}
</cfscript>