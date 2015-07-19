// ErrorInsteadOfFail.cfc

component extends=testbox.system.basespec {

	function run(){
		describe("Replicating issue", function(){

			it("demonstrates a baseline", function(){
				expect(false).toBeTrue();
			});

			it("demonstrates the error", function(){
				var results = [1,2,3];
				results.each(function(result){
					expect(false).toBeTrue();
				});
			});
		});
		describe("Experimental variations", function(){
			describe("Using an iteration function", function(){

				it("checks if it's cos the function is inline", function(){
					var results = [1,2,3];
					var testFunctionViaExpression = function(){
						expect(false).toBeTrue();
					};
					results.each(testFunctionViaExpression);
				});

				it("checks to see if it's just cos it's an iteration function (using a function statement)", function(){
					var results = [1,2,3];
					results.each(testFunctionViaStatement);
				});

				it("checks to see if it's just the method, or the procedural function does it too", function(){
					var results = [1,2,3];
					arrayEach(results, function(result){
						expect(false).toBeTrue();
					});
				});
			});

			describe("Just via a function", function(){

				it("checks to see if it's just cos it's a function expression", function(){
					var testFunctionViaExpression = function(){
						expect(false).toBeTrue();
					};
					testFunctionViaExpression();
				});

				it("checks to see if it's a problem with function statements", function(){
					testFunctionViaStatement();
				});
			});

		});
	}

	function testFunctionViaStatement(){
		expect(false).toBeTrue();
	}

}