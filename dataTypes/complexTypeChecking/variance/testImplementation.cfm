<cfscript>
function safeRun(message="", task){
	writeOutput("<h4>#message#</h4>");
	try {
		task();
		writeOutput("Ran OK<br>");
	} catch(any e){
		writeOutput("
			Error<br>
			Type: #e.type#<br>
			Message: #e.message#<br>
			Detail: #e.detail#<br>
		");
	} finally {
		writeOutput("<hr>");
	}
}


safeRun("Testing baseline", function(){
	o = new ImplementationBaseline();
});

safeRun("Testing covariance", function(){
	o = new ImplementationWithCovariance();
});
	
</cfscript>