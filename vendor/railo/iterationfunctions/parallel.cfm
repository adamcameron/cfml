<cfscript>
	start = getTickCount();
	[1,2,3,4].each(function(v){
		writeLog(file="parallelIteration2", text="#v# before sleep. Ticks #getTickCount()-start#")
		sleep(2000)
		writeLog(file="parallelIteration2", text="#v# after sleep. Ticks #getTickCount()-start#")
	}, true)
	writeLog(file="parallelIteration2", text="Total execution time #getTickCount()-start#ms")
</cfscript>