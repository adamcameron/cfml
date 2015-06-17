<cfscript>
	o = new ScriptBased();
	writeDump(getMetadata(o).functions);
exit;
	try {
		writeOutput("Running privateFunction()<br>");
		o.privateFunction();
		writeOutput("OK");
	}catch(any e){
		writeOutput("[#e.type#] #e.message# (#e.detail#)");
	}finally{
		writeOutput("<hr>");
	}

	try {
		writeOutput("Running booleanFunction()<br>");
		o.booleanFunction(x=["not boolean"]);
		writeOutput("OK");
	}catch(any e){
		writeOutput("[#e.type#] #e.message# (#e.detail#)");
	}finally{
		writeOutput("<hr>");
	}
</cfscript>