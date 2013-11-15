<cfscript>
	son = new Person();

	son.firstName="Zachary";
	son.lastName="Cameron Lynch";

	param name="URL.DOB" default=now();
	son.dob = URL.DOB;

	writeOutput("firstName: #son.firstName#<br>");
	writeOutput("lastName: #son.lastName#<br>");
	try {
		writeOutput("DOB: #son.dob#<br>");
	}
	catch (any e){
		writeOutput("ERROR: #e.type# #e.message# #e.detail#<br>#e.tagcontext[1].raw_trace#<br>");
	}
</cfscript>
