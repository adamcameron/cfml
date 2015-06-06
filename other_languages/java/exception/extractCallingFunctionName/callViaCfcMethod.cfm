<cfscript>
	renamedFunctionName = someApiCall;
	
	renamedFunctionName();
	
	/**
	* @output true
	*/
	void function someApiCall(){
		loggingFunction();
	}

	/**
	* @output true
	*/
	void function loggingFunction(){
		writeOutput('Log entry created @ request of #createObject("component", "Util").getCallingFunctionName()#<br/>');
	}

</cfscript>
