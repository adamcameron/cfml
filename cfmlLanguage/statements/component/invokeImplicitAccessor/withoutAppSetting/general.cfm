<cfscript>
	o = new General();
	u = createUuid();
	writeOutput("u: #u#<br>");
	o.x = u;

	o.checkMetadata();

	writeOutput("Value from o.x: #o.x#<br>");

</cfscript>