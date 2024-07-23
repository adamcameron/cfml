component extends=testbox.system.BaseSpec {

	expectedClassName = ""; // not the best, but this should be an abstract class

	function run(){
		describe("baseline", function(){
			it("has the correct class", function(){
				var ordered = getTestStruct();
				var className = ordered.getClass().getName();
				expect(className).toBe(expectedClassName);
			});
			it("maintains expected key order", function(){
				var ordered = getTestStruct();
				var actualKeys = reduceKeysToList(ordered);
				var expectedKeys = getExpectedKeysFromTestStruct();
				expect(actualKeys).toBe(expectedKeys);
			});
		});
		describe("interaction", function(){
			it("doesn't change type if a normal struct is appended", function(){
				var ordered = getTestStruct();

				var ordinary = {
					ordinaryKey = 2
				};
				ordered.append(ordinary);

				var className = ordered.getClass().getName();
				expect(className).toBe(expectedClassName);
			});
		});
		describe("method/function compat", function(){
			it("map() returns correct struct type", function(){
				var ordered = getTestStruct();
				var mapped = ordered.map(function(k,v,struct){
					return true;
				});
				var className = mapped.getClass().getName();
				expect(className).toBe(expectedClassName);
			});
			it("structMap() returns correct struct type", function(){
				var ordered = getTestStruct();
				var mapped = structMap(ordered, function(k,v,struct){
					return true;
				});
				var className = mapped.getClass().getName();
				expect(className).toBe(expectedClassName);
			});
			it("works with duplicate()", function(){
				var ordered = getTestStruct();
				var duplicated = ordered.duplicate();

				var className = duplicated.getClass().getName();
				expect(className).toBe(expectedClassName);
				expect(duplicated).toBe(ordered);
			});
			it("works with copy()", function(){
				var ordered = getTestStruct();
				var copied = ordered.copy();

				var className = copied.getClass().getName();
				expect(className).toBe(expectedClassName);
				expect(copied).toBe(ordered);
			});
			it("works with isStruct()", function(){
				var ordered = getTestStruct();

				expect(isStruct(ordered)).toBeTrue();
			});
			it("works with clear()", function(){
				var ordered = getTestStruct();
				ordered.clear();

				var className = ordered.getClass().getName();
				expect(className).toBe(expectedClassName);
				expect(ordered).toBe(structNew("ordered"));
			});
			it("works with JSON (de)serialisation", function(){
				var ordered = getTestStruct();
				var json = serializeJson(ordered);
				var deserialised = deserializeJson(json);
				expect(deserialised).toBe(ordered);
			});
			it("works WDDX (de)serialisation", function(){
				var ordered = getTestStruct();
				var wddx = "";
				var deserialised = false;
				cfwddx(action="cfml2wddx", input=ordered, output="wddx");
				cfwddx(action="wddx2cfml", input=wddx, output="deserialised");
				expect(deserialised).toBe(ordered);
			});
		});
	}

	function reduceKeysToList(struct){
		return struct.reduce(function(list,key){
			return list.listAppend(key);
		}, "");
	}

}


