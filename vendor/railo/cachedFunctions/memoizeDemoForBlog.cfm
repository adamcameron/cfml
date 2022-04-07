<cfscript>
// memoizeDemoForBlog.cfm

include "memoizeWithLifetime.cfm";

// memoize the function
heavyLifting = memoize(
	function(required string label) {
		var msg = "Executed for #label# at: #ts()#<br>";
		sleep(1000);
		return msg;
	},
	createTimespan(0,0,0,5)
);


// demonstrate the memoisation
testCalls("Not Cached");
testCalls("Cached");
sleep(5000);
testCalls("Decached");


// helper functions
function testCalls(message){
	writeOutput("<h3>#message#</h3>");
	writeOutput("Called at: #ts()#<br>");
	writeOutput(heavyLifting(label="first"));
	sleep(1000);
	writeOutput("Called at: #ts()#<br>");
	writeOutput(heavyLifting(label="second"));
	sleep(1000);	
}
function ts(){
	return timeFormat(now(), "HH:MM:SS");
}
</cfscript>