<cfscript>
results = [];
testUrl = "http://adamcameroncoldfusion.cfmldeveloper.com/temp/echoticks.cfm?requestId=";

startTime = getTickCount();

httpResponse = new Http(method="get", url="#testUrl#0").send().getPrefix();

remoteLastRun = listLast(httpResponse.fileContent, ":");
lastRun = getTickCount();

arrayAppend(
	results,
	{
		local	= {test=0, duration=lastRun-startTime},
		remote	=  {test=0, duration="-"}
	}
);

for (i=1; i <= 10; i++){
	httpResponse = new Http(method="get", url="#testUrl##i#").send().getPrefix();
	remoteTest		= listFirst(httpResponse.fileContent, ":");
	remoteRunTime	= listLast(httpResponse.fileContent, ":");
	
	arrayAppend(
		results,
		{
			local	= {test=i, duration= getTickCount()-lastRun},
			remote	=  {test=remoteTest, duration=remoteRunTime-remoteLastRun}
		} 
	);
	lastRun = getTickCount();
	remoteLastRun = remoteRunTime;
}
writeDump(var=results, label="Total time: #getTickCount()-startTime#");
</cfscript>