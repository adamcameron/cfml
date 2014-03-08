<cfscript>
writeLog(file=logName, text="Before defer() @ #ts()#");

deferredJob = defer(
	job = function(){
		writeLog(file=logName, text="job() started @ #ts()#");
		sleep(5000);
		writeLog(file=logName, text="job() finished @ #ts()#");
	},
	onTerminate = onTerminate

);
writeLog(file=logName, text="After defer() @ #ts()#");

for (i=1; i <= 6; i++){
	writeOutput("Status: #deferredJob.getStatus()#<br>#repeatString(" ", 500)#");
	if (i == 3){
		deferredJob.terminate();
	}
	sleep(1000);
}
dumpLog();
</cfscript>