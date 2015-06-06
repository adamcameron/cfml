<cfscript>
	writeOutput("Top<br />");
	sleep(5000);
	writeOutput("After snooze<br />");
	writeOutput("Before flush<br />");
	flush();
	writeOutput("After flush<br />");
	sleep(5000);
	writeOutput("After second snooze<br />");
	writeOutput("Before second flush<br />");
	flush;
	writeOutput("After second flush<br />");
</cfscript>