<cfscript>
// complexArgs.cfm
function heavyLifting(required struct someArg) cachedwithin=createTimespan(0,0,0,5) {
	sleep(1000);
	return "Executed for #structKeyList(someArg)# at: #now()#<br>";
}

writeOutput(heavyLifting({key="value"}));
</cfscript>
