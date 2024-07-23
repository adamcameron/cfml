component extends=testbox.system.BaseSpec {

	URL.urlVariableToFind = true;
	form.formVariableToFind = true;

	function run(){
		describe("Regression tests", function(){
			it("still finds scoped variables", function(){
				var result = URL.urlVariableToFind;
				expect(result).toBeTrue();
			});
		});
		describe("Functionality tests", function(){
			it("does not find unscoped URL variables", function(){
				expect(function(){
				var result = urlVariableToFind;
				}).toThrow(message="Variable urlVariableToFind is undefined.");
			});
			it("does not find unscoped form variables", function(){
				expect(function(){
				var result = formVariableToFind;
				}).toThrow(message="Variable formVariableToFind is undefined.");
			});
			it("does not find unscoped CGI variables", function(){
				expect(function(){
				var result = script_name;
				}).toThrow(message="Variable script_name is undefined.");
			});
			it("does find unscoped variables-scope variables", function(){
				variables.variableToFind = "should be found";
				var result = variableToFind;

				expect(result).toBe(variables.variableToFind);
			});
		});
	}
}