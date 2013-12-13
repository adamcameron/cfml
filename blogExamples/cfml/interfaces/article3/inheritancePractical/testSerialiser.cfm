<cfscript>
	simple = new Simple(["tahi","rua","toru","wha"]);
	complex = new Complex({
		one		= "tahi",
		two		= "rua",
		three	= "toru",
		four	= "wha"
	});
	
	serialiser = new Serialiser();
	
	try {
		writeOutput("<hr>");
		writeOutput("serialiser.toString(simple)<br>");
		writeOutput(serialiser.toString(simple));
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	
	try {
		writeOutput("<hr>");
		writeOutput("serialiser.toJson(simple)<br>");
		writeOutput(serialiser.toJson(simple));
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	
	try {
		writeOutput("<hr>");
		writeOutput("serialiser.toString(complex)<br>");
		writeOutput(serialiser.toString(complex));
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	
	try {
		writeOutput("<hr>");
		writeOutput("serialiser.toJson(complex)<br>");
		writeOutput(serialiser.toJson(complex));
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	
	try {
		writeOutput("<hr>");
		writeOutput("serialiser.createStringable(simple)<br>");
		writeOutput(getMetadata(serialiser.createStringable(simple)).name);
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	
	try {
		writeOutput("<hr>");
		writeOutput("serialiser.createStringable(complex)<br>");
		writeOutput(getMetadata(serialiser.createStringable(complex)).name);
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	
	try {
		writeOutput("<hr>");
		writeOutput("serialiser.createJsonable(simple)<br>");
		writeOutput(getMetadata(serialiser.createJsonable(simple)).name);
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	
	try {
		writeOutput("<hr>");
		writeOutput("serialiser.createJsonable(complex)<br>");
		writeOutput(getMetadata(serialiser.createJsonable(complex)).name);
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	
</cfscript>