<cfscript>
	param name="attributes.message" default="";
	
	param name="request.count" default=0;
	
	variables.when = "bound at execution #++request.count#";
	attributes.f();
	attributes.g();
	writeDump(
		var ={
			isCustomFunction = isCustomFunction(attributes.f),		
			isClosure = isClosure(attributes.f)
		},
		label=attributes.message
	);
</cfscript>