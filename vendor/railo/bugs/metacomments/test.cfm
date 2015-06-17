<cfscript>
// test.cfm
o = new ScriptBased();
writeDump(getMetadata(o));

safe(function(){
	writeOutput("Running parentFunction()<br>");
	o.parentFunction();
	writeOutput("OK");
});

safe(function(){
	writeOutput("Running privateFunction()<br>");
	o.privateFunction();
	writeOutput("OK");
});

safe(function(){
	writeOutput("Running booleanFunction()<br>");
	o.booleanFunction(x=["not boolean"]);
	writeOutput("OK");
});


function safe(f){
	try {
		f();
	}catch(any e){
		writeOutput("[#e.type#] #e.message# (#e.detail#)");
	}finally{
		writeOutput("<hr>");
	}
}
</cfscript>