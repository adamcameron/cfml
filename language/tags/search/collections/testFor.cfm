<cfscript>
	cfdump = createObject("component", "CFML").cfDump;

	foo = "Glenn";
	bar = "Sux";

	varNames = structNew();
	varNames.var1 = "foo";
	varNames.var2 = "bar";
	
	instance = structNew();
	
	for (instance.key in varNames){
		cfdump(instance);
	}
	


</cfscript>