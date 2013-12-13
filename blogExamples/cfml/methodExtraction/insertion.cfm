<cfscript>
	// insertion.cfm

	myObj = new My();

	myObj.getVariables = function(){
		return variables;
	};

	writeDump(myObj.getVariables());
</cfscript>