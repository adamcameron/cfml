<cfscript>
// demo.cfm

include "common.cfm";

function heavyLifting(required string label) cachedwithin=createTimespan(0,0,0,5) {
	sleep(1000);
	return "Executed for #label# at: #ts()#<br>";
}

// not cached
message = "Not Cached";
include "testCalls.cfm";

// cached
message = "Cached";
include "testCalls.cfm";

sleep(5000);

// decached
message = "Decached";
include "testCalls.cfm";
</cfscript>