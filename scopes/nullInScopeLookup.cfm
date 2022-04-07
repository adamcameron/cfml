<cfscript>
if (URL.useNull ?: false){
	payload = javacast("null", "");
}else{
	payload = "set";
}

writeOutput("[#payload#]");
</cfscript>