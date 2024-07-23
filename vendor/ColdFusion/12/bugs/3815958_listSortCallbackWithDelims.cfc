component extends=testbox.system.BaseSpec {

	function run(){
		
		var comparator = function(e1, e2){
			var e1Len = e1.len();
			var e2Len = e2.len();
			var lengthComparison = sgn(e1Len - e2Len);
			if (lengthComparison) return lengthComparison;
			return compare(e1, e2);
		};
		var baseList = "tahi,rua,toru,wha";
		var expectedList = "rua,wha,tahi,toru";
		var delims = "|,;,:,/";

		var multiDelimList = baseList.listReduce(function(multiDelimList, element, index){
			return multiDelimList.listAppend(element, delims.listGetAt(index));
		}, "");
		
		describe(".listSort() with callback tests", function(){
			it("respects the default delimiter implicitly", function(){
				var sortedList = baseList.listSort(comparator);
				expect(sortedList).toBe(expectedList);
			});

			it("respects the default delimiter explicitly", function(){
				var sortedList = baseList.listSort(comparator, ",");
				expect(sortedList).toBe(expectedList);
			});

			it("respects an alternative single-char delimiter", function(){
				var delim = delims.listFirst();
				var baseList = baseList.listChangeDelims(delim);
				var sortedList = baseList.listSort(comparator, delim);
				var expectedList = expectedList.listChangeDelims(delim);
				expect(sortedList).toBe(expectedList);
			});

			it("respects an alternative single-char delimiter", function(){
				var delim = delims.listFirst();
				var baseList = baseList.listChangeDelims(delim);
				var sortedList = baseList.listSort(comparator, delim);
				var expectedList = expectedList.listChangeDelims(delim);
				expect(sortedList).toBe(expectedList);
			});

			it("respects an alternative multi-char delimiter", function(){
				var delim = delims.listFirst();
				var sortedList = multiDelimList.listSort(comparator, delims);
				var expectedList = expectedList.listChangeDelims(delim);
				expect(sortedList).toBe(expectedList);
			});

		});
		
		describe("listSort() with callback tests", function(){
			it("respects the default delimiter implicitly", function(){
				var sortedList = listSort(baseList, comparator);
				expect(sortedList).toBe(expectedList);
			});

			it("respects the default delimiter explicitly", function(){
				var sortedList = listSort(baseList, comparator, ",");
				expect(sortedList).toBe(expectedList);
			});

			it("respects an alternative single-char delimiter", function(){
				var delim = delims.listFirst();
				var baseList = baseList.listChangeDelims(delim);
				var sortedList = listSort(baseList, comparator, delim);
				var expectedList = expectedList.listChangeDelims(delim);
				expect(sortedList).toBe(expectedList);
			});

			it("respects an alternative multi-char delimiter", function(){
				var delim = delims.listFirst();
				var sortedList = listSort(multiDelimList, comparator, delims);
				var expectedList = expectedList.listChangeDelims(delim);
				expect(sortedList).toBe(expectedList);
			});
		});
	}
}