<cfscript>
try {
	throw "some bullshit";
} catch(any e){
	writeOutput("[#e.message#][#e.detail#]<br />");
	writeDump(e);
}
try {
	throw (message="message", type="type", errorcode="code", detail="detail", extendedinfo="extended");
} catch(any e){
	writeOutput("[#e.message#][#e.detail#]<br />");
	writeDump(e);
}

</cfscript>

