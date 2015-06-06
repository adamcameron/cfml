<cfscript>
	param name="URL.optionalParam" default="optional";
	param name="URL.requiredParam";
	
	writeDump(var=URL, label="URL");
	writeDump(var=variables, label="variables");
</cfscript>