// TestMergeSort.cfc
component extends="testbox.system.BaseSpec" {
	function beforeAll(){
		include "udfs/mergeSort.cfm";

		simpleComparator = function(e1,e2){
			return compare(e1,e2);
		};
	}

	function run(){
		describe("Tests for mergeSort()", function(){
			it("works with an empty array", function(){
				expect(
					mergeSort([], simpleComparator)
				).toBe([]);
			});
			it("works with a one-element array", function(){
				expect(
					mergeSort(["a"], simpleComparator)
				).toBe(["a"]);
			});
			it("works with a two-element, already-sorted array", function(){
				expect(
					mergeSort(["a", "b"], simpleComparator)
				).toBe(["a", "b"]);
			});
			it("works with a two-element, unsorted array", function(){
				expect(
					mergeSort(["b", "a"], simpleComparator)
				).toBe(["a", "b"]);
			});
			it("works with an array of identical elements", function(){
				expect(
					mergeSort(["a", "a", "a", "a", "a"], simpleComparator)
				).toBe(["a", "a", "a", "a", "a"]);
			});
			it("works with an even-lengthed array", function(){
				expect(
					mergeSort(["d", "b", "a", "c"], simpleComparator)
				).toBe(["a", "b", "c", "d"]);
			});
			it("works with an odd-lengthed array", function(){
				expect(
					mergeSort(["a", "d", "c", "e", "b"], simpleComparator)
				).toBe(["a", "b", "c", "d", "e"]);
			});
			it("perserves the ordering of same-valued elements", function(){
				var arrayToSort = [
					{sortOn="b", index=1},
					{sortOn="a", index=1},
					{sortOn="c", index=1},
					{sortOn="c", index=2},
					{sortOn="a", index=2},
					{sortOn="b", index=2},
					{sortOn="c", index=3},
					{sortOn="b", index=3},
					{sortOn="a", index=3},
					{sortOn="a", index=4},
					{sortOn="b", index=4},
					{sortOn="c", index=4}
				];
				var expectedResult = [
					{sortOn="a", index=1},
					{sortOn="a", index=2},
					{sortOn="a", index=3},
					{sortOn="a", index=4},
					{sortOn="b", index=1},
					{sortOn="b", index=2},
					{sortOn="b", index=3},
					{sortOn="b", index=4},
					{sortOn="c", index=1},
					{sortOn="c", index=2},
					{sortOn="c", index=3},
					{sortOn="c", index=4}
				];
				expect(
					mergeSort(arrayToSort, function(e1,e2){
						return compare(e1.sortOn, e2.sortOn);
					})
				).toBe(expectedResult);
			});
		});
	}
}