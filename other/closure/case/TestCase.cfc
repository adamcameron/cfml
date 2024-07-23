// TestCase.cfc
component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		//include "case.cfm"
		include "case.cfm"

		variables.validateKeysReturnedFromCase = function(required struct struct, required array keys){
			if (struct.count() != keys.len()){
				return false
			}
			return keys.every(function(key){
				return struct.keyExists(key) && isClosure(struct[key])
			})
		}
		variables.passException = function(){
			throw(type="ValueExecutedCorrectlyException")
		}
		variables.failException = function(){
			throw(type="ValueExecutedIncorrectlyException")
		}
		variables.passValue = function(){
			return "ValueExecutedCorrectly"
		}
		variables.failValue = function(){
			return "ValueExecutedIncorrectly"
		}
		variables.callback = function(){}
	}

	function run(){
		describe("Tests for case()", function(){
			describe("Tests for case() function", function(){
				it("compiles when called case()", function(){
					expect(
						isCustomFunction(case)
					).toBeTrue()
				})
				it("returns when() function", function(){
					var test = case()
					expect(validateKeysReturnedFromCase(test, ["when"])).toBeTrue()
				})
			});
			describe("Tests for when() function", function(){
				beforeEach(function(){
					test = case()
				})
				it("is a function", function(){
					expect(
						isClosure(test.when) 
					).toBeTrue()
				})
				it("requires a condition argument", function(){
					expect(function(){
						test.when()
					}).toThrow("MissingArgumentException")
				})
				it("accepts a condition argument which is a function", function(){
					expect(function(){
						test.when(callback)
					})._not().toThrow("InvalidArgumentException")
				})
				it("accepts a condition argument which is a boolean", function(){
					expect(function(){
						test.when(true)
					})._not().toThrow("InvalidArgumentException")
				})
				it("rejects a condition argument is neither a function nor a boolean", function(){
					expect(function(){
						test.when("NOT_A_FUNCTION")
					}).toThrow("InvalidArgumentException")
				})
				it("returns a struct containing a then() function", function(){
					var result = test.when(true)
					expect(validateKeysReturnedFromCase(result, ["then"])).toBeTrue()
				})
				it("can be chained", function(){
					var result = test.when(true).then(callback).when(true)
					expect(validateKeysReturnedFromCase(result, ["then"])).toBeTrue()
				})
				it("correctly handles a function returning true as a condition", function(){
					var result = test.when(function(){return true}).then(passValue).end()
					expect(result).toBe(variables.passValue())
				})
				it("correctly handles a function returning false as a condition", function(){
					var result = test.when(function(){return false}).then(failValue).end() ?: variables.passValue()
					expect(result).toBe(variables.passValue())
				})
				it("correctly handles a boolean true as a condition", function(){
					var result = test.when(true).then(passValue).end()
					expect(result).toBe(variables.passValue())
				})
				it("correctly handles a boolean false as a condition", function(){
					var result = test.when(false).then(failValue).end() ?: variables.passValue()
					expect(result).toBe(variables.passValue())
				})
			})
			describe("Tests for then() function", function(){
				beforeEach(function(){
					test = case()
				})
				it("is a function", function(){
					expect(
						isClosure(test.when(true).then) 
					).toBeTrue()
				})
				it("requires a value argument", function(){
					expect(function(){
						test.when(true).then(notvalue=callback)
					}).toThrow("MissingArgumentException")
				})
				it("requires a value argument which is a function", function(){
					expect(function(){
						test.when(true).then("NOT_A_FUNCTION")
					}).toThrow("InvalidArgumentException")
				})
				it("returns a struct containing when(), else() and end() functions", function(){
					var result = test.when(true).then(callback)
					expect(validateKeysReturnedFromCase(result, ["when", "else", "end"])).toBeTrue()
				})
				it("can be chained", function(){
					var result = test.when(true).then(callback).when(true).then(callback)
					expect(validateKeysReturnedFromCase(result, ["when", "else", "end"])).toBeTrue()
				})
				it("executes the value", function(){
					expect(function(){
						test.when(true).then(passException)
					}).toThrow("ValueExecutedCorrectlyException")
				})
				it("doesn't execute a subsequent value when the condition is already true", function(){
					expect(function(){
						test.when(true).then(passException).when(true).then(failException)
					})._not().toThrow("ValueExecutedIncorrectlyException")
				})
				it("doesn't execute a false condition", function(){
					expect(function(){
						test.when(false).then(failException).when(true).then(passException)
					})._not().toThrow("ValueExecutedIncorrectlyException")
				})
			})
			describe("Tests for else() function", function(){
				beforeEach(function(){
					test = case()
				})
				it("is a function", function(){
					expect(
						isClosure(test.when(true).then(callback).else) 
					).toBeTrue()
				})
				it("requires a value argument", function(){
					expect(function(){
						test.when(true).then(callback).else()
					}).toThrow("MissingArgumentException")
				})
				it("requires a value argument which is a function", function(){
					expect(function(){
						test.when(true).then(callback).else(value="NOT_A_FUNCTION")
					}).toThrow("InvalidArgumentException")
				})
				it("returns a struct containing an end() function", function(){
					var result = test.when(true).then(callback).else(callback)
					expect(validateKeysReturnedFromCase(result, ["end"])).toBeTrue()
				})
				it("cannot be chained", function(){
					var result = 
					expect(function(){
						test.when(true).then(callback).else(callback).else(callback)
					}).toThrow()
				})
				it("executes when the condition is not already true", function(){
					expect(function(){
						test.when(false).then(passException).else(failException)
					}).toThrow("ValueExecutedIncorrectlyException")
				})
				it("doesn't execute when the condition is already true", function(){
					expect(function(){
						test.when(true).then(passException).else(failException)
					})._not().toThrow("ValueExecutedIncorrectlyException")
				})
			})
			describe("Tests for end() function", function(){
				it("is a function", function(){
					expect(
						isClosure(test.when(true).then(callback).end) 
					).toBeTrue()
				})
				it("returns the result", function(){
					expect(
						case().when(true).then(passValue).end() 
					).toBe(passValue())
				})
				it("returns the result of an earlier true condition followed by false conditions", function(){
					expect(
						case().when(true).then(passValue).when(false).then(failValue).end() 
					).toBe(passValue())
				})
				it("returns the result of the first true condition", function(){
					expect(
						case().when(true).then(passValue).when(false).then(failValue).end() 
					).toBe(passValue())
				})
			})
		})
	}
}