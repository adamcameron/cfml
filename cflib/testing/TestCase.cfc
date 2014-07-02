// TestCase.cfc
component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		include "udfs/case.cfm";

		variables.validateKeysReturnedFromCase = function(required struct struct, required array keys){
			if (struct.count() != keys.len()){
				return false;
			}
			return keys.every(function(key){
				return struct.keyExists(key) && isClosure(struct[key]);
			});
		}
		variables.trueCondition = function(){
			return true;
		}
		variables.falseCondition = function(){
			return false;
		}
		variables.passException = function(){
			throw(type="ValueExecutedCorrectlyException");
		}
		variables.failException = function(){
			throw(type="ValueExecutedIncorrectlyException");
		}
		variables.passValue = function(){
			return "ValueExecutedCorrectly";
		}
		variables.failValue = function(){
			return "ValueExecutedIncorrectly";
		}
	}

	function run(){
		describe("Tests for case()", function(){
			describe("Tests for case() function", function(){
				it("compiles when called case()", function(){
					expect(
						isCustomFunction(case)
					).toBeTrue();
				});
				it("returns when(), else() and end() functions", function(){
					var test = case();
					expect(validateKeysReturnedFromCase(test, ["when", "else", "end"])).toBeTrue();
				});
			});
			describe("Tests for when() function", function(){
				beforeEach(function(){
					test = case();
				});
				it("is a function", function(){
					expect(
						isClosure(test.when) 
					).toBeTrue();
				});
				it("requires a condition argument", function(){
					expect(function(){
						test.when(value=function(){});
					}).toThrow("MissingArgumentException");
				});
				it("requires a condition argument which is a function", function(){
					expect(function(){
						test.when(condition="NOT_A_FUNCTION", value=function(){});
					}).toThrow("InvalidArgumentException");
				});
				it("requires a value argument", function(){
					expect(function(){
						test.when(condition=function(){});
					}).toThrow("MissingArgumentException");
				});
				it("requires a value argument which is a function", function(){
					expect(function(){
						test.when(condition=function(){}, value="NOT_A_FUNCTION");
					}).toThrow("InvalidArgumentException");
				});
				it("returns a case function", function(){
					var result = test.when(function(){},function(){});
					expect(validateKeysReturnedFromCase(result, ["when", "else", "end"])).toBeTrue();
				});
				it("can be chained", function(){
					var result = test.when(function(){},function(){}).when(function(){},function(){});
					expect(validateKeysReturnedFromCase(result, ["when", "else", "end"])).toBeTrue();
				});
				it("executes the value", function(){
					expect(function(){
						test.when(trueCondition, passException);
					}).toThrow("ValueExecutedCorrectlyException");
				});
				it("doesn't execute a subsequent value when the condition is already true", function(){
					expect(function(){
						test.when(trueCondition, passException).when(trueCondition, failException);
					})._not().toThrow("ValueExecutedIncorrectlyException");
				});
				it("doesn't execute a false condition", function(){
					expect(function(){
						test.when(falseCondition, failException).when(trueCondition, passException);
					})._not().toThrow("ValueExecutedIncorrectlyException");
				});
			});
			describe("Tests for else() function", function(){
				beforeEach(function(){
					test = case();
				});
				it("is a function", function(){
					expect(
						isClosure(test.else) 
					).toBeTrue();
				});
				it("requires a value argument", function(){
					expect(function(){
						test.else();
					}).toThrow("MissingArgumentException");
				});
				it("requires a value argument which is a function", function(){
					expect(function(){
						test.else(value="NOT_A_FUNCTION");
					}).toThrow("InvalidArgumentException");
				});
				it("returns a case function", function(){
					var result = test.else(function(){});
					expect(validateKeysReturnedFromCase(result, ["end"])).toBeTrue();
				});
				it("cannot be chained", function(){
					var result = 
					expect(function(){
						test.else(function(){}).else(function(){});
					}).toThrow();
				});
				it("executes when the condition is not already true", function(){
					expect(function(){
						test.when(falseCondition, passException).else(failException);
					}).toThrow("ValueExecutedIncorrectlyException");
				});
				it("doesn't execute when the condition is already true", function(){
					expect(function(){
						test.when(trueCondition, passException).else(failException);
					})._not().toThrow("ValueExecutedIncorrectlyException");
				});
			});
			describe("Tests for end() function", function(){
				it("is a function", function(){
					expect(
						isClosure(test.end) 
					).toBeTrue();
				});
				it("returns the result", function(){
					expect(
						case().when(trueCondition, passValue).end() 
					).toBe(passValue());
				});
				it("returns the result of an earlier true condition followed by false conditions", function(){
					expect(
						case().when(trueCondition, passValue).when(falseCondition, failValue).end() 
					).toBe(passValue());
				});
				it("returns the result of the first true condition", function(){
					expect(
						case().when(trueCondition, passValue).when(trueCondition, failValue).end() 
					).toBe(passValue());
				});
			});
		});
	}
}