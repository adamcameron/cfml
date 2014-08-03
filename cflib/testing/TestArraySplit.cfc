// TestArraySplit.cfc
component extends="testbox.system.BaseSpec" {
	function beforeAll(){
		include "udfs/arraySplit.cfm";
	}

	function run(){
		describe("Tests for arraySplit()", function(){
			it("works with an empty array", function(){
				expect(
					arraySplit([], 1)
				).toBe({left=[],right=[]});
			});
			it("works with a one-element array", function(){
				expect(
					arraySplit(["a"], 1)
				).toBe({left=["a"],right=[]});
			});
			it("works with a two-element array", function(){
				expect(
					arraySplit(["a", "b"], 1)
				).toBe({left=["a"],right=["b"]});
			});
			it("works with the index outside the bounds of the array", function(){
				expect(
					arraySplit(["a", "b"], 3)
				).toBe({left=["a","b"],right=[]});
			});
			it("works with a sparse array", function(){
				var testArray = ["a"];
				testArray[3] = "c";
				testArray[5] = "e";

				var expected = {left=[], right=[]};
				expected.left[1] = "a";
				expected.left[3] = "c";
				expected.right[2] = "e";
				var result = arraySplit(testArray, 3);
				expect(result).toBe(expected);
			});
		});
	}
}