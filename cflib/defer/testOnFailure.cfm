<cfscript>
writeLog(file=logName, text="Before defer() @ #ts()#");

deferredJob = defer(
	job = function(){
		throw(type="DeferException", message="Fail!", detail="Test onFailure", errorcode="003");
	},
	onFailure = onFailure
);
writeLog(file=logName, text="After defer() @ #ts()#");
dumpLog();
</cfscript>