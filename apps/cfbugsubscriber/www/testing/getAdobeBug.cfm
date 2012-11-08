<cfscript>
	param name="URL.id" default="3339105";
	
	adobeBug = new AdobeBug(URL.id);
	
	result = adobeBug.getBug();
	
	writeDump(variables);
</cfscript>