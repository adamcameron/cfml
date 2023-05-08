component extends=testbox.system.BaseSpec {

	function run(){
		describe("Baseline", function(){
			it("is not passed by reference", function(){
				var array = [];
				modifiesArray(array);				
				var expected = [];
				expect(array).toBe(expected);
			});
		});	
	}

	function modifiesArray(array){
		array.append("new element");
	}

}