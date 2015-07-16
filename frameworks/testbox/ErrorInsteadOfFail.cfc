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
	}

}