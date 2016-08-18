component {

	simpleTests = [{
			description = "All sorted",
			array = [1,2,3,4,5],
			expectation = true
		},{
			description = "One switch needed",
			array = [2,1,3,4,5],
			expectation = true
		},{
			description = "Two switches needed",
			array = [2,1,4,3,5],
			expectation = false
		}
	];

	function getSimpleTests(){
		return simpleTests;
	}

	function outputLineHandler(string){
		if (isDefined("CLI")){
			return CLI.writeLn(string);
		}
		return writeOutput(string & "<br>");
	}

	function runTests(testFunction, tests) {
		tests.each(function(test) {
			result = testFunction(test.array);
			outputLineHandler("#test.description# #serializeJson(test.array)# => #result# (Expectation: #test.expectation#) (PASSED: #result EQ test.expectation#)");
		});
	}
}