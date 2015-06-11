<cfscript>
	void function actualFunction(){
		writeOutput("getFunctionCalledName(): #getFunctionCalledName()#<br />");
	}

	ref2Function = actualFunction;
	
	actualFunction();
	ref2Function();
</cfscript>