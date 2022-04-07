<cfscript>
	o = new C(firstName="Adam", lastName="Cameron", phoneNumber="07969998592");
	o.address = "56 Mulberry Way";
	writeDump(o.getInstance());
	
	writeOutput(o.address & "<br />");
</cfscript>