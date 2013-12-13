<cfscript>
// demo.cfm

include "common.cfm";

function heavyLifting(required string label) cachedwithin=createTimespan(0,0,0,5) {
	sleep(1000);
	return "Executed for #label# at: #ts()#<br>";
}


// not cached
include("testCalls.cfm");


// cached
include("testCalls.cfm");

sleep(5000);

// decached
include("testCalls.cfm");
</cfscript>
