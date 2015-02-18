<cfscript>

	writeOutput("Postfix Increment<br>");
	counter = new Counter();
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");

	writeOutput("Postfix Increment<br>");
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");
	counter.counter++;
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");
	writeOutput("<hr>");

	writeOutput("Prefix Decrement<br>");
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");
	--counter.counter;
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");
	writeOutput("<hr>");

	writeOutput("Shorthand Addition<br>");
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");
	counter.counter+=2;
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");
	writeOutput("<hr>");

	writeOutput("Long hand addition<br>");
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");
	counter.counter = counter.counter + 3;
	writeOutput("Internal value for counter: #counter.variables.counter#<br>");
	writeOutput("<hr>");
</cfscript>