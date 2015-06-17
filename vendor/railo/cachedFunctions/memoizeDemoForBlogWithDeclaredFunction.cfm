<cfscript>
// memoizeDemoForBlogWithDeclaredFunction.cfm

include "memoizeWithLifetime.cfm";

function someFunction(required string label) {
	var msg = "Executed for #label# at: #ts()#<br>";
	sleep(1000);
	return msg;
};


heavyLifting = memoize(
	someFunction,
	createTimespan(0,0,0,5)
);

testCalls("Not Cached");
testCalls("Cached");

sleep(5000);
testCalls("Decached");


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