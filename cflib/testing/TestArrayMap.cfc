// TestQueryGetRow.cfc
component extends="testbox.system.BaseSpec" {

	function run(){
		include "udfs/arrayMap.cfm";
		var testArray  = ["tahi","rua","toru","wha"];

		describe("Tests arrayMap()", function(){
			it("handles an empty array", function(){
				expect(
					_arrayMap([], function(v,i,a){
						return v;
					})
				).toBe([]);
			});
			it("handles a direct transformation", function(){
				expect(
					_arrayMap(testArray, function(v,i,a){
						return v;
					})
				).toBe(testArray);
			});
			it("handles an actual transformation", function(){
				var newArray =_arrayMap(testArray, function(v,i,a){
					return ucase(v);
				}); 
				expect(
					newArray.toList()
				).toBeWithCase("TAHI,RUA,TORU,WHA");
			});
		});
	}

}