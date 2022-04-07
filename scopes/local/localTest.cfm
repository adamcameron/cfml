<cfscript>
	boolean function f(){
		var local = structNew();
		local.key = "value";
		dump(var=local, label="local");
		dump(var=getPageContext().getActiveFunctionLocalScope(), label="getActiveFunctionLocalScope");
		return true;
	}

	f();
</cfscript>