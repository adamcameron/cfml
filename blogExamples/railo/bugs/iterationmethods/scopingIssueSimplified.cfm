<cfscript>
counter = 0;
incrementCounter = function(){
	return ++counter;
};
writeOutput("incrementCounter() returned: #incrementCounter()# (current value of counter: #counter#)<br>");
writeOutput("incrementCounter() returned: #incrementCounter()# (current value of counter: #counter#)<br>");
</cfscript>