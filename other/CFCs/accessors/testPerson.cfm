<cfscript>
	z = new Person();
	z.setPerson({firstName="Zachary", lastName="Cameron Lynch"});
	
	writeOutput("fisrtName: #z.firstName#<br />");
	writeOutput("lasrtName: #z.lastName#<br />");
</cfscript>