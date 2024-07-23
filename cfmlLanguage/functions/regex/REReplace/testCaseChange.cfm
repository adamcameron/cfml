<cfscript>

	function formatTestName(testName){
		return trim(reReplace(arguments.testName, "_(\w)", " \u\1", "all"));
	}

	s = "_1_basic_test";

	writeOutput(formatTestName(testName=s));
</cfscript>