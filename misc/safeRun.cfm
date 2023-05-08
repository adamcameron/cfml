<cfscript>
// safeRun.php

function safeRun(message="", task){
	writeOutput("#message#<br>");
	try {
		task();
		writeOutput("Ran OK<br>");
	}catch (any e){
		writeOutput("
			Type: #e.type#<br>
			Message: #e.message#<br>
		");
	}finally {
		writeOutput("<hr>");
	}
}	
</cfscript>