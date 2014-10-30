<cfscript>
	l = "tahi||toru||";

	l.each(function(e){
		writeDump(arguments);
		writeOutput(e & "<br>");
	}, "|", false);
</cfscript>