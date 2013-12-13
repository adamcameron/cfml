<cfscript>
	andrew = new Andrew();
	newFunction = andrew.publicMethod('Zachary');
	newFunction2= andrew.publicMethod2('Zachary');

	writeOutput("publicMethod->newFunction: #newFunction()#<br>");
	writeOutput("<hr>");
	writeOutput("publicMethod2->newFunction2: #newFunction2()#<br>");
</cfscript>