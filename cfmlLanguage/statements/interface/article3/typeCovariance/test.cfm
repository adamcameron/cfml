<cfscript>
	// test.cfm
	c = new Child();

	function test(I object){
		return object.factory();
	}
	
	result = test(c);	
	writeDump(variables);
</cfscript>