// TestReplaceWithCallback.cfc

component extends="testbox.system.testing.BaseSpec" {

	function beforeAll(){
		include "function.cfm";
		include "callbacksForTests.cfm";

		addMatchers({
			toBeSimpleValue	= function(expectation, args={}){
				return isSimpleValue(expectation.actual);
			}
		});
	}

	function run(){
		describe("Testing replaceWithCallback()", function(){
			describe("Testing the callback is being handled correctly", function(){
				it("passes a baseline test", function(){
					var result = replaceWithCallback("match 1 match 2", "(match) ([1-3])", basicCallback, "ONE", true);
					expect(false).toBeTrue();
				});
				it("returns a value from the callback", function(){
					var result = replaceWithCallback("match 1 match 2", "match [1-3]", testReturnValueCallback, "ONE", true);
					expect(false).toBeTrue();
				});
			});
			describe("Testing replaceWithCallback() argument validation", function(){
				it("accepts a function for a callback", function(){
					
				});
				it("rejects a non-function for a callback", function(){
					
				});
				it("accepts ONE as a scope", function(){
					
				});
				it("accepts ALL as a scope", function(){
					
				});
				it("rejects any other value as a scope", function(){
					
				});
			});
			describe("Testing case sensitivity of replaceWithCallback()", function(){
				it("respects a case-sensitive operation", function(){
					
				});
				it("respects a case-insensitive operation", function(){
					
				});
			});
			describe("Testing plurality of matches", function(){
				it("correctly handles zero matches", function(){
					
				});
				it("correctly handles a single match", function(){
					
				});
				it("correctly handles many matches", function(){
					
				});
			});
		});

	}

}
// http://www.bennadel.com/blog/2331-ColdFusion-10-Beta-Closures-And-Function-Expressions.htm
