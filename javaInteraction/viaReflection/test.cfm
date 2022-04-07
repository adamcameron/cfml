<cfscript>
include "/scribble/shared/util/stopwatch.cfm";

param name="URL.haystack"	default="";
param name="URL.needle"		default="";
param name="URL.iterations"	default=0;

writeOutput("Search for '#URL.needle#' in '#URL.haystack#' #URL.iterations# times<br><br>");

// CFML tests

runTest(function(){
		find(URL.needle, URL.haystack);
	},
	"Using find() CFML function"
);

runTest(function(){
		var i = URL.iterations;
		find(URL.needle, URL.haystack);
	},
	"Using find() CFML function plus another statement"
);


runTest(function(){
		URL.haystack.find(URL.needle);
	},
	"Using .find() CFML member function"
);

runTest(function(){
		URL.haystack.indexOf(URL.needle);
	},
	"Using indexOf() Java method via CFML"
);
writeOutput("<hr>");
exit;
// Java tests

o = createObject("java", "TestReflectionPerformance");
runTest(function(){
		o.directCall(URL.needle, URL.haystack);
	},
	"Using indexOf() Java method natively"
);

runTest(function(){
		o.viaReflection(URL.needle, URL.haystack);
	},
	"Using indexOf() Java method via reflection"
);


function runTest(required function test, string message=""){
	var sw = makeStopWatch();
	sw.start();
	for (var i=1; i <= URL.iterations; i++){
		test();
	}
	sw.stop();
	writeOutput("#message#: #sw.getTimeline()[2].totalDuration#ms<br>");
}
</cfscript>