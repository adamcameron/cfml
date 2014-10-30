<cfscript>
// listEach.cfm
oddNumbers = "tahi||toru||";

oddNumbers.each(function(e){
	writeDump(arguments);
	writeOutput(e & "<br>");
}, "|", true);
</cfscript>