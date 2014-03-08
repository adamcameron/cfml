<cfscript>
writeLog(file=logName, text="Before defer() @ #ts()#");

localVar = "VARIABLE SET IN MAINLINE CODE";

deferredJob = defer(
	function(){
		writeLog(file=logName, text="job() called with #localVar# @ #ts()#");
	}
);
writeLog(file=logName, text="After defer() @ #ts()#");
dumpLog();
</cfscript>