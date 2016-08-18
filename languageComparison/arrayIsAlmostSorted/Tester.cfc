component {

	tests = [
		{description="already sorted, values contiguous", array=[1,2,3,4,5], expected=true},
		{description="already sorted, values not contiguous", array=[2,4,6,8,10], expected=true},
		{description="off by one, first pair", array=[2,1,3,4,5], expected=true},
		{description="off by one, subsequent pair", array=[1,2,4,3,5], expected=true},
		{description="off by one, last pair", array=[1,2,3,5,4], expected=true},
		{description="off by one, first and last", array=[5,2,3,4,1], expected=true},
		{description="off by one, first and middle", array=[3,2,1,4,5], expected=true},
		{description="off by one, last and middle", array=[1,2,5,4,3], expected=true},
		{description="off by two, first two pairs", array=[2,1,4,3,5], expected=false},
		{description="off by two, last two pairs", array=[1,3,2,5,4], expected=false},
		{description="off by two, first and last pairs", array=[2,1,3,5,4], expected=false},
		{description="off by two, within three elements", array=[2,3,1,4,5], expected=false},
		{description="off by many, reversed", array=[5,4,3,2,1], expected=false}
	];

	function runTests(functionToTest, testSet){
		var testsToRun = isNull(testSet) ? tests : testSet.map(function(i){
			return tests[i];
		});
	
		testsToRun.each(function(test, i){
			try {
				var result = functionToTest(test.array);
				var pass = result == test.expected;
				var message = "#i# #test.description# => #pass#";
			} catch (any e){
				message = "#i# #test.description# #e.message# #e.detail#";
			} finally {
				outputMessage(message);
			}
		});
	}
	
	function outputMessage(message){
		if (isDefined("CLI")){
			CLI.writeLn(message);
		}else{
			writeOutput("#message#<br>");
		}
	}
}