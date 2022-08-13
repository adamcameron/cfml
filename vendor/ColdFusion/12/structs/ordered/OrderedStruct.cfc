component extends=structs.Baseline {

	expectedClassName = "coldfusion.runtime.StructOrdered";

	function run(){

		super.run();

		describe("Testing the order of key extraction", function(){
			it("returns keys in expected order from keyList()", function(){
				var ordered = getTestStruct();
				var actualKeys = ordered.keyList();
				var expectedKeys = getExpectedKeysFromTestStruct();
				expect(actualKeys).toBe(expectedKeys);
			});
			it("returns keys in expected order from keyArray()", function(){
				var ordered = getTestStruct();
				var actualKeys = ordered.keyArray().toList();
				var expectedKeys = getExpectedKeysFromTestStruct();
				expect(actualKeys).toBe(expectedKeys);
			});
			it("returns the keys in expected order from collection loop", function(){
				var ordered = getTestStruct();
				actualKeys = "";
				for (var key in ordered){
					actualKeys = actualKeys.listAppend(key);
				}
				var expectedKeys = getExpectedKeysFromTestStruct();
				expect(actualKeys).toBe(expectedKeys);
			});
			it("returns the keys in expected order from cfloop", function(){
				/* see 3754577
				var ordered = getTestStruct();
				actualKeys = "";
				cfloop(item="key", collection=ordered){
					actualKeys = actualKeys.listAppend(key);
				}
				var expectedKeys = getExpectedKeysFromTestStruct();
				expect(actualKeys).toBe(expectedKeys);
				*/
			});
		});
	}

	function getTestStruct(){
		var ordered = structNew("ordered");
		ordered.first = 1;
		ordered.second = 2;
		ordered.third = 3;
		ordered.fourth = 4;
		ordered.fifth = 5;					
		return ordered;		
	}

	function getExpectedKeysFromTestStruct(){
		return "first,second,third,fourth,fifth";
	}

}


