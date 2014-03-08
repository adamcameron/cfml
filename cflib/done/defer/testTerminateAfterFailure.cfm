<cfscript>
writeLog(file=logName, text="Before defer() @ #ts()#");

deferredJob = defer(
	job = function(){
		writeLog(file=logName, text="job() started @ #ts()#");
		sleep(2000);
		writeLog(file=logName, text="job() after sleep() @ #ts()#");
		throw(type="DeferException", message="Fail!", detail="Test terminate() after failure", errorcode="003");
	},
	onFailure = onFailure,
	onTerminate = onTerminate
);
writeLog(file=logName, text="After defer() @ #ts()#");

for (i=1; i <= 6; i++){
	writeOutput("Status: #deferredJob.getStatus()#<br>#repeatString(" ", 500)#");
	if (i == 4){
		deferredJob.terminate();
	}
	sleep(1000);
}
dumpLog();
</cfscript>