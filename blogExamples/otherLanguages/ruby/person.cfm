<cfscript>
	writeOutput("Create new Person<br>");
	son = new Person();

	writeOutput("Set firstName<br>");
	son.firstName="Zachary";

	writeOutput("Set lastName<br>");
	son.lastName="Cameron Lynch";

	writeOutput("Set DOB<br>");
	param URL.DOB=now();
	son.dob = URL.DOB;

	writeOutput("Get firstName: #son.firstName#<br>");
	writeOutput("Get lastName: #son.lastName#<br>");
	try {
		writeOutput("Get DOB: #son.dob#<br>");
	}
	catch (any e){
		writeOutput("ERROR: #e.type# #e.message# #e.detail#<br>#e.tagcontext[1].raw_trace#<br>");
	}
</cfscript>
