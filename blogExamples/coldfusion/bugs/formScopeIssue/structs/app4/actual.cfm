<cfscript>
	/*
	form:		tahi
	URL:		rua
	variables:	toru
	request:	wha
	this:		rima (in C.cfc)
	local:		ono (in C.cfc)
	arguments:	whitu
	attributes:	waru
	*/


	variables.number	= "toru";
	request.number		= "wha";

	session.scopes = {
		form		= form,
		url			= URL,
		request		= request,
		variables	= variables
	};
	o = new C();
	o.f("whitu");
	structDelete(variables, "o");

</cfscript>
<cf_tag number="waru">
<cfscript>
	writeDump(var=form, label="form");
	writeDump(var=URL, label="URL");
	writeDump(var=request, label="request");
	writeDump(var=variables, label="variables");
	writeDump(var=session, label="session");
</cfscript>
