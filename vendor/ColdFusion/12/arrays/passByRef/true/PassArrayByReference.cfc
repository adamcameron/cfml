component extends=testbox.system.BaseSpec {

	function run(){
		describe("Baseline", function(){
			it("is passed by reference", function(){
				var array = [];
				modifiesArray(array);				
				var expected = ["new element"];
				expect(array).toBe(expected);
			});
		});	
	}

	function modifiesArray(array){
		array.append("new element");
	}

}