<cfscript>
include "function.cfm";

result = threadJob(onRun=onRunHandler, threads=5, data={}, onjoin=onJoinHandler);


function onRunHandler(){
	writeDump(var=arguments, label="onRunHandler");
}

function onJoinHandler(){
	writeDump(var=arguments, label="onJoinHandler");
}
</cfscript>