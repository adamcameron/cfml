<cfscript>
makeTimer = function(name){
	var startTick = getTickCount();
	return function(milestone){
		return "#name# (#milestone#): #getTickCount()-startTick#ms<br />";
	};
};

firstTimer = makeTimer("Started first");
writeOutput(firstTimer("Start"));

sleep(1000);

secondTimer = makeTimer("Started later");
writeOutput(firstTimer("First Milestone"));
writeOutput(secondTimer("Start"));

sleep(1000);

writeOutput(firstTimer("Second Milestone"));
writeOutput(secondTimer("First Milestone"));
</cfscript>