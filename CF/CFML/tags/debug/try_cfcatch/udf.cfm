<cffunction name="getCurrentFunctionName" access="public" output="false" returntype="string" hint="Returns the current function's name.">
	<cfscript>
		var aStackTrace	= createObject("java", "coldfusion.runtime.CustomException").init("", "", "", "", "").getStackTrace();
		var i			= 0;
		var bSelfFound	= false;
		var sMethodName	= "";

		for (i=1; i le arrayLen(aStackTrace); i=i+1){
			if (aStackTrace[i].getMethodName() eq "runFunction"){
				if (not bSelfFound){
					// the first one is a reference to THIS function, so take note that we've found it and move on: we want the next one
					bSelfFound = true;
					continue;
				}else{
					// it's the second one, so the one we want
					sMethodName = reReplace(aStackTrace[i].getClassName(), "^.*?\$func(.*?)$", "\1", "ONE");
					break;
				}
			}	// not interested in any of the other entries
		}
		return sMethodName;
	</cfscript>
</cffunction>