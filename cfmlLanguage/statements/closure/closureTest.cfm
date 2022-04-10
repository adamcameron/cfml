<cfscript>
	o = new ClosureTest(number=pi());
	
	doubler = o.f();

	doubled = doubler();
	writeDump(variables);
	
	o.setNumber(number=42);
	doubler = o.f();
	doubled = doubler();
	writeDump(variables);
</cfscript>