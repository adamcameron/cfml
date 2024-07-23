<cfscript>
	param name="URL.magnitude" default=1;
	
	string = repeatString("x", 10^URL.magnitude);
	
	writeDump({
		magnitude	= URL.magnitude,
		expected	= 10^URL.magnitude,
		actual		= len(string)
	});
</cfscript>