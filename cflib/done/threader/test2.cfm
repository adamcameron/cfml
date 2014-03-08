<cfscript>
include "function.cfm";

result = threadJob(onRun=onRunHandler, threads=4, data=["tahi", "rua", "toru", "wha"], onjoin=onJoinHandler);
writeDump(result);

function onRunHandler(required array data, required struct threadMetadata, required struct thread){
	thread.result = ucase(data[threadMetadata.current]);
}

function onJoinHandler(required struct data, required array threadNames){
	result = [];
	for (var threadName in threadNames){
		arrayAppend(result, data[threadName].result);
	}
	return result;
}
</cfscript>