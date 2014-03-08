<cfscript>
writeLog(file=logName, text="Before defer() @ #ts()#");

deferredJob = defer(job);

writeLog(file=logName, text="After defer() @ #ts()#");

dumpLog();
</cfscript>