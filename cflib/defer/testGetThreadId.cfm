<cfscript>
writeLog(file=logName, text="Before firstDeferredJob @ #ts()#");
firstDeferredJob = defer(
	job		= function(){
		writeLog(file=logName, text="firstDeferredJob.job() called @ #ts()#");
		sleep(10000);
		writeLog(file=logName, text="firstDeferredJob.job() finished @ #ts()#");
	},
	onError = onError
);
writeLog(file=logName, text="After firstDeferredJob @ #ts()#");

writeLog(file=logName, text="Before secondDeferredJob @ #ts()#");
secondDeferredJob = defer(
	job		= function(){
		writeLog(file=logName, text="secondDeferredJob.job() called @ #ts()#");
		sleep(10000);
		writeLog(file=logName, text="secondDeferredJob.job() finished @ #ts()#");
	},
	onError = onError
);
writeLog(file=logName, text="After secondDeferredJob @ #ts()#");

threadIds = [
	firstDeferredJob.getThreadId(),
	secondDeferredJob.getThreadId()
];
writeOutput("firstDeferredJob thread ID: #threadIds[1]#<br>");
writeOutput("secondDeferredJob thread ID: #threadIds[2]#<br>");

writeLog(file=logName, text="Before join @ #ts()#");
thread action="join" name=arrayToList(threadIds);
writeLog(file=logName, text="After join @ #ts()#");

dumpLog();
</cfscript>