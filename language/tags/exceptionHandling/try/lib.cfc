<cfcomponent output="false">


	<cffunction name="getCurrentFunctionName" access="public" output="false" returntype="string" hint="Returns the current function's name.">
		<cfscript>
			var aStackTrace	= createObject("java", "coldfusion.runtime.CustomException").init("", "", "", "", "").getStackTrace();
			var i			= 0;
			var bSelfFound	= false;
			var sMethodName	= "";

			for (i=1; i le arrayLen(aStackTrace); i=i+1){
				if (aStackTrace[i].getMethodName() eq "runFunction"){
					if (bSelfFound){
						// it's the second one, so the one we want
						sMethodName = reReplace(aStackTrace[i].getClassName(), "^.*?\$func(.*?)$", "\1", "ONE");
						break;
					}else{
						bSelfFound = true;
						continue;
					}
				}else{
					continue;
				}
			}
			return sMethodName;
		</cfscript>
	</cffunction>


</cfcomponent>