<cfscript>
// TestMemoizeWithLifetime.cfm

include "memoizeWithLifetime.cfm";

include "common.cfm";

heavyLifting = memoize(
	function(required string label) {
		var msg = "Executed for #label# at: #ts()#<br>";
		sleep(1000);
		return msg;
	},
	createTimespan(0,0,0,5)
);

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