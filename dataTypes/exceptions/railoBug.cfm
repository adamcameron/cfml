<cfscript>
//railoBug.cfm
function f(raiseException){
	try {
		return "in try";
	}
	catch (any e){
		return "exception caught";
	}
	finally {
		return "finally executed";
	}
}

f();	
</cfscript>