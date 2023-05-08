<cfscript>
// listEach.cfm
oddNumbers = "tahi||toru";

writeOutput("<h3>each()</h3>");
oddNumbers.each(function(){
	writeDump(arguments);
}, "|", true);

writeOutput("<h3>map()</h3>");
oddNumbers.map(function(){
	writeDump(arguments);
}, "|", true);

writeOutput("<h3>reduce()</h3>");
oddNumbers.reduce(function(){
	writeDump(arguments);
}, "|", true);
</cfscript>