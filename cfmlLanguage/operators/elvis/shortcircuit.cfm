<cfscript>
	param boolean URL.returnAValue=true;

	result = nuller(URL.returnAValue) ?: defaulter();

	writeOutput(result);

	function defaulter(){
		writeOutput("hit");
		return "default";
	}

	function nuller(required boolean returnAValue){
		if (returnAValue) return true;
	}
</cfscript>