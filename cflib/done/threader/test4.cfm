<cfscript>
include "function.cfm";

data = {
	a1 = deserializeJson(fileRead(expandPath("../arrayDiff/1.js"))),
	a2 = deserializeJson(fileRead(expandPath("../arrayDiff/2.js")))
};


startTime = getTickCount();
a3 = threadJob(onRun=onRunHandler, threads=1, data={a1=["whero", "karaka", "kakariki"], a2=["karaka"]}, onjoin=onJoinHandler);
endTime = getTickCount();
writeOutput("Execution time: #endTime-startTime#ms<br />");
writeOutput("#arrayLen(a3)#:#serializeJson(a3)#<br /><hr /><br />");

function onRunHandler(required struct data, required struct threadMetadata, required struct thread){
	var array1Len	= arrayLen(data.a1);
	var chunkSize	= ceiling(array1Len / threadMetadata.total);
	var startIdx	= (index-1) * chunkSize;
	var endIdx		= min(array1Len, startIdx + chunkSize);
	if (startIdx <= endIdx){
		thread.result = duplicate(data.a1.subList(startIdx, endIdx));
		thread.result.removeAll(data.a2);
	}else{
		thread.result = [];
	}
}

function onJoinHandler(required struct data, required array threadNames){
	result = [];
	for (var threadName in threadNames){
		result.addAll(data[threadName].result);
	}
	return result;
}
</cfscript>