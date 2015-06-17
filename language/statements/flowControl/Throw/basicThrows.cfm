<cfscript>
try {
	throw "some bullshit";
} catch(any e){
	writeOutput("[#e.message#][#e.detail#]<br />");
	writeDump(e);
}
try {
	throw ("some bullshit");
} catch(any e){
	writeOutput("[#e.message#][#e.detail#]<br />");
	writeDump(e);
}

</cfscript>

