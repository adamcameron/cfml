<cfscript>
// safeRun.cfm

function safeRun(message="", task){
	try {
		writeOutput("#message#<br>");
		task();
		writeOutput("Ran OK<br>");
	}catch (any e){
		writeOutput("
			Type: #e.type#<br>
			Message: #e.message#<br>
		");
	} finally {
		writeOutput("<hr>");
	}
}	
</cfscript>