<cfscript>
	o = new ClosureExample();
	
	cString = o.getClosureFunction(condition="string");
	cNotString = o.getClosureFunction(condition="notString");

	writeOutput(cString("foo"));
	writeOutput(cNotString("foo"));
</cfscript>