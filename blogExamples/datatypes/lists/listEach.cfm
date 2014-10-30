<cfscript>
// listEach.cfm
oddNumbers = "tahi||toru||";

oddNumbers.each(function(e){
	writeOutput(e & "<br>");
}, "|", false);
</cfscript>