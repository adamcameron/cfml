component extends=structs.Baseline {

	expectedClassName = "coldfusion.runtime.StructSorted";

	function run(){
		super.run();

		describe("sorting", function(){
			it("returns keys in appropriate", function(){
				var sorted = getTestStructWithDirection("desc");
				var actualKeys = reduceKeysToList(sorted);
				var expectedKeys = getExpectedKeysFromTestStructWithDirection("desc");
				expect(actualKeys).toBe(expectedKeys);
			});
		});

		describe("Testing the order of key extraction when sorted asc", testKeyExtractionByDirectionAsc);
		describe("Testing the order of key extraction when sorted desc", testKeyExtractionByDirectionDesc);
	}


	function getTestStruct(){
		return getTestStructWithDirection();		
	}

	function getTestStructWithDirection(direction="asc"){
		var ordered = structNew("sorted", direction);
		ordered.first = 1;
		ordered.second = 2;
		ordered.third = 3;
		ordered.fourth = 4;
		ordered.fifth = 5;					
		return ordered;		
	}

	function getExpectedKeysFromTestStruct(){
		return getExpectedKeysFromTestStructWithDirection();
	}

	function getExpectedKeysFromTestStructWithDirection(direction="asc"){
		var expectedKeys = "fifth,first,fourth,second,third";
		var sortedKeys = expectedKeys.listSort("textnocase", direction);
		return sortedKeys;

	}

	testKeyExtractionByDirectionAsc = function(){
		testKeyExtractionByDirection("asc");
	};

	testKeyExtractionByDirectionDesc = function(){
		testKeyExtractionByDirection("desc");
	};

	function testKeyExtractionByDirection(direction){
		it("returns keys in expected order from keyList()", function(){
			var sorted = getTestStructWithDirection(direction);
			var actualKeys = sorted.keyList();
			var expectedKeys = getExpectedKeysFromTestStructWithDirection(direction);
			expect(actualKeys).toBe(expectedKeys);
		});
		it("returns keys in expected order from keyArray()", function(){
			var sorted = getTestStructWithDirection(direction);
			var actualKeys = sorted.keyArray().toList();
			var expectedKeys = getExpectedKeysFromTestStructWithDirection(direction);
			expect(actualKeys).toBe(expectedKeys);
		});
		it("returns the keys in expected order from collection loop", function(){
			var sorted = getTestStructWithDirection(direction);
			actualKeys = "";
			for (var key in sorted){
				actualKeys = actualKeys.listAppend(key);
			}
			var expectedKeys = getExpectedKeysFromTestStructWithDirection(direction);
			expect(actualKeys).toBe(expectedKeys);
		});
		it("returns the keys in expected order from cfloop", function(){
			/* see 3754577
			var sorted = getTestStructWithDirection(direction);
			actualKeys = "";
			cfloop(item="key", collection=sorted){
				actualKeys = actualKeys.listAppend(key);
			}
			var expectedKeys = getExpectedKeysFromTestStructWithDirection(direction);
			expect(actualKeys).toBe(expectedKeys);
			*/
		});
	};

}
