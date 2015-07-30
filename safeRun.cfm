<cfscript>
// safeRun.cfm

function safeRun(message="", task){
	writeOutput("#message#<br>");
	try {
		task();
		writeOutput("Ran OK<br>");
	}catch (any e){
		writeOutput("
			Type: #e.type#<br>
			Message: #e.message#<br>
			Detail: #e.detail#<br>
		");
	}finally {
		writeOutput("<hr>");
	}
}
</cfscript>