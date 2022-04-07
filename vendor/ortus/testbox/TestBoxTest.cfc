component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		include "myFunction.cfm";
	}

	function run(testResults, testBox){
		describe("Checking to see if TestBox works", function(){
			it("works on the simplest test", function(){
				var testValue = 17;
				var result = myFunction(testValue);
				expect(result).toBe({double=34});
			});
			it("works on a second test", function(){
				var testValue = 19;
				var result = myFunction(testValue);
				expect(result).toBe({double=38});
			});
		});

	}

}