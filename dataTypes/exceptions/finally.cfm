<cfscript>
// finally.cfm

logFile = "testFinally01";

function f(raiseException){
	try {
		if (raiseException){
			throw(type="TestException");
		}
		//writeLog(file=logFile, text="in try");
		return "no exception thrown";
	}
	catch (any e){
		//writeLog(file=logFile, text="in catch");
		return "exception caught";
	}
	finally {
		//writeLog(file=logFile, text="in finally");
		return "finally executed";
	}
}

f(true);

/*
writeLog(file=logFile, text="TEST WITH EXCEPTION");
writeLog(file=logFile, text="function called here >>> #f(true)# <<<");

writeLog(file=logFile, text="TEST WITHOUT EXCEPTION");
writeLog(file=logFile, text="function called here >>> #f(false)# <<<");
*/
</cfscript>