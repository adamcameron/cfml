<cfscript>
writeLog(file=logName, text="Before firstDeferredJob @ #ts()#");
firstDeferredJob = defer(
	job		= function(){
		writeLog(file=logName, text="firstDeferredJob.job() called @ #ts()#");
		sleep(5000);
		writeLog(file=logName, text="firstDeferredJob.job() finished @ #ts()#");
	},
	onError = onError
);
writeLog(file=logName, text="After firstDeferredJob @ #ts()#");

writeLog(file=logName, text="Before secondDeferredJob @ #ts()#");
secondDeferredJob = defer(
	job		= function(){
		writeLog(file=logName, text="secondDeferredJob.job() called @ #ts()#");
		sleep(5000);
		writeLog(file=logName, text="secondDeferredJob.job() finished @ #ts()#");
	},
	onError = onError
);
writeLog(file=logName, text="After secondDeferredJob @ #ts()#");


for (i=1; i <= 7; i++){
	writeOutput("firstDeferredJob status: #firstDeferredJob.getStatus()#<br>");
	writeOutput("secondDeferredJob status: #secondDeferredJob.getStatus()#<br>");
	sleep(1000);
}
writeDump(variables);
dumpLog();
</cfscript>