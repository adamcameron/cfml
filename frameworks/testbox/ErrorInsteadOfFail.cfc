component extends=testbox.system.basespec {

	function run(){
		describe("Replicating issue", function(){
			var simpleExpectationHandler = function(){
				expect(false).toBeTrue();
			};
			var iterativeExpectationHandler = function(results){
				results.each(function(result){
					expect(false).toBeTrue();
				});
			};

			it("demonstrates a baseline", function(){
				simpleExpectationHandler();
			});
			it("demonstrates the error", function(){
				iterativeExpectationHandler([1,2,3]);
			});

		});
	}

}