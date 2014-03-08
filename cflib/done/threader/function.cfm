<cfscript>
public any function threadJob(required any onRun, numeric threads=1, any data, any onJoin){
	var threadNames = [];
	var threadName	= "";

	for (var i=1; i <= threads; i++){
		threadName = createUuid();
		arrayAppend(threadNames, threadName);
		thread action="run" name=threadName index=i threads=threads data=data onRun=onRun {
			onRun(data=data, threadMetadata={current=index,total=threads}, thread=thread);
		}
	}

	if (structKeyExists(arguments, "onJoin")){
		thread action="join" name=arrayToList(threadNames);
		var result = onJoin(data=cfthread, threadNames=threadNames);
	}

	if (structKeyExists(local, "result")){
		return result;
	}
}
</cfscript>