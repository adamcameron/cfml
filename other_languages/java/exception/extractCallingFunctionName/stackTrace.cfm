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
		writeOutput("Log entry created @ request of #getCallingFunctionName()#<br/>");
	}


	/**
	* @output true
	*/
	string function getCallingFunctionName(){
		var aStackTrace	= createObject("java", "coldfusion.runtime.CustomException").init("", "", "", "", "").getStackTrace();
		var i				= 0;
		var bSelfFound		= false;
		var bCallerFound	= false;
		var sFunctionName	= "";
		

		for (i=1; i le arrayLen(aStackTrace); i=i+1){
			if (aStackTrace[i].getMethodName() eq "runFunction"){
				if (!bSelfFound){
					bSelfFound = true;
					continue;
				}else if (!bCallerFound){
					bCallerFound = true;
					continue;
				}else{
					// this is the one we want
					sFunctionName = reReplace(aStackTrace[i].getClassName(), "^.*?\$func(.*?)$", "\1", "ONE"); 
					break;
				}
			}
		}
		return sFunctionName;
	}
</cfscript>
