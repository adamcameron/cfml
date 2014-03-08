<cfscript>
writeLog(file=logName, text="Before defer() @ #ts()#");

deferredJob = defer(
	function(){
		writeLog(file=logName, text="job() called @ #ts()#");
		sleep(5000);
		writeLog(file=logName, text="job() finished @ #ts()#");
	}
);
writeLog(file=logName, text="After defer() @ #ts()#");

for (i=1; i <= 7; i++){
	writeOutput("Status: #deferredJob.getStatus()#<br>#repeatString(" ", 500)#");
	sleep(1000);
}
dumpLog();
</cfscript>