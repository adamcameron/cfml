component extends=testbox.system.BaseSpec {

	URL.urlVariableToFind = true;
	form.formVariableToFind = true;

	function run(){
		describe("Regression tests", function(){
			it("does find unscoped URL variables", function(){
				expect(function(){
				var result = urlVariableToFind;
				}).notToThrow(message="Variable urlVariableToFind is undefined.");
			});
			it("does find unscoped form variables", function(){
				expect(function(){
				var result = formVariableToFind;
				}).notToThrow(message="Variable formVariableToFind is undefined.");
			});
			it("does find unscoped CGI variables", function(){
				expect(function(){
				var result = script_name;
				}).notToThrow(message="Variable script_name is undefined.");
			});
		});
	}
}