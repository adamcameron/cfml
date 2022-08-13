component extends=testbox.system.BaseSpec {
	function run(){

		var originalList = "whero,karaka,kowhai,kakariki,kikorangi,poropango,papura";

		describe("listSort() tests", function(){
			var comparator = function(e1, e2){
				var e1len = e1.len();
				var e2len = e2.len();
				var lengthComparison = sgn(e1Len-e2Len);
				if (lengthComparison) return sgn(e1Len-e2Len);
				return compare(e1,e2);
			};


			it("works with .listSort() accepting a callback for its sorting comparator", function(){
				var result = originalList.listSort(comparator);
				var sortedByLengthThenValue = "whero,karaka,kowhai,papura,kakariki,kikorangi,poropango";
				expect(result).toBe(sortedByLengthThenValue);
			});
			it("works with listSort() accepting a callback for its sorting comparator", function(){
				var result = listSort(originalList, comparator);
				var sortedByLengthThenValue = "whero,karaka,kowhai,papura,kakariki,kikorangi,poropango";
				expect(result).toBe(sortedByLengthThenValue);
			});
		});

		describe("struct sort() tests", function(){
			var comparator = function(e1, e2){
				var e1len = e1.len();
				var e2len = e2.len();
				var lengthComparison = sgn(e1Len-e2Len);
				if (lengthComparison) return sgn(e1Len-e2Len);
				return compare(e1,e2);
			};

			var originalStruct = originalList.listReduce(function(originalStruct, element){
				originalStruct[element] = element.reverse();
				return originalStruct;
			}, {});

			it("works with .sort() accepting a callback for its sorting comparator", function(){
				var result = originalStruct.sort(comparator);
				var sortedByLengthThenValue = ["whero","karaka","papura","kowhai","kakariki","kikorangi","poropango"];
				expect(result).toBe(sortedByLengthThenValue);
			});
			it("works with structSort() accepting a callback for its sorting comparator", function(){
				var result = structSort(originalStruct, comparator);
				var sortedByLengthThenValue = ["whero","karaka","papura","kowhai","kakariki","kikorangi","poropango"];
				expect(result).toBe(sortedByLengthThenValue);
			});
			it("has access to struct keys", function(){

			},[],true);

		});

		describe("query sort() tests", function(){
			var comparator = function(e1, e2){
				throw;
			};

			var originalQuery = originalList.listReduce(function(originalQuery, element, index){
				originalQuery.addRow([[index,element]]);
				return originalQuery;
			}, queryNew("id,key"));

			it("works with .sort() accepting a callback for its sorting comparator", function(){
				var result = originalQuery.sort(comparator);
				// method not implemented
			}, [], true);

			it("works with querySort() accepting a callback for its sorting comparator", function(){
				var result = querySort(originalQuery, comparator);
				// function not implemented
			}, [], true);
		}); 
	}
}