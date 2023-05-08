component extends="testbox.system.BaseSpec" {
	function run() {
		describe("Other sort tests", function(){
			it("is a baseline showing using BIFs as a callback", function(){
				var testString = "AbCd";
				var applyTo = function(object, operation){
					return operation(object);
				};

				var result = applyTo(testString, ucase);
				
				expect(result).toBeWithCase("ABCD");
			});
			describe("using arrays", function(){
				it("can use a function expression calling compareNoCase as a string comparator when sorting", function(){
					var arrayToSort = ["d","C","b","A"];
					
					arrayToSort.sort(function(e1,e2){
						return compareNoCase(e1, e2);
					});
					
					expect(arrayToSort).toBe(["A","b","C","d"]);
				});
				it("can use the compareNoCase BIF as a string comparator when sorting", function(){
					var arrayToSort = ["d","C","b","A"];
					
					arrayToSort.sort(compareNoCase);
					
					expect(arrayToSort).toBe(["A","b","C","d"]);
				});
			});
			describe("using lists", function(){
				it("can use a function expression calling compareNoCase as a string comparator when sorting", function(){
					var listToSort = "d,C,b,A";
					
					var sortedList = listToSort.listSort(function(e1,e2){
						return compareNoCase(e1, e2);
					});
					
					expect(sortedList).toBe("A,b,C,d");
					expect(listToSort).toBe("d,C,b,A");
				});
				it("can use the compareNoCase BIF as a string comparator when sorting", function(){
					var listToSort = "d,C,b,A";
					
					var sortedList = listToSort.listSort(compareNoCase);
					
					expect(sortedList).toBe("A,b,C,d");
					expect(listToSort).toBe("d,C,b,A");
				});
			});
		});
	}
}