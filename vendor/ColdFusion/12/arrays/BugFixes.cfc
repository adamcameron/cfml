component extends=testbox.system.BaseSpec {

	array = ["tahi", "rua", "toru", "wha"];

	function run(){
		describe("arrayFindNoCase() tests", function(){
			it("performs a case-insensitive search on simple values", function(){
				var result = arrayFindNoCase(array, "TORU");
				var expected = 3;
				expect(result).toBe(expected);
			});
			it("throws an exception if the second argument is not a simple value", function(){
				expect(function(){
					var result = arrayFindNoCase(array, ["TORU"]);
				}).toThrow(type="java.lang.IllegalArgumentException");
			});
			it("throws an exception if the first argument contains elements that are not simple values", function(){
				expect(function(){
					var result = arrayFindNoCase(array, ["TORU"]);
				}).toThrow(type="java.lang.IllegalArgumentException");
			});
			it("throws an exception if the first argument contains dates", function(){
				expect(function(){
					var dateTimeToFind = now();
					var array = [dateTimeToFind.add("d", -1), dateTimeToFind, dateTimeToFind.add("d", 1)];
					var result = arrayFindNoCase(array, dateTimeToFind);
				}).toThrow(type="java.lang.IllegalArgumentException");
			});
		});

		describe(".findNoCase() tests", function(){
			it("performs a case-insensitive search on simple values", function(){
				var result = array.findNoCase("TORU");
				var expected = 3;
				expect(result).toBe(expected);
			});
			it("throws an exception if the second argument is not a simple value", function(){
				expect(function(){
					var result = array.findNoCase(["TORU"]);
				}).toThrow(type="java.lang.IllegalArgumentException");
			});
			it("throws an exception if the first argument contains elements that are not simple values", function(){
				expect(function(){
					var array = ["tahi", ["rua"], "toru", {four="wha"}];
					var result = array.findNoCase(["TORU"]);
				}).toThrow(type="java.lang.IllegalArgumentException");
			});
			it("throws an exception if the first argument contains dates", function(){
				expect(function(){
					var dateTimeToFind = now();
					var array = [dateTimeToFind.add("d", -1), dateTimeToFind, dateTimeToFind.add("d", 1)];
					var result = array.findNoCase(dateTimeToFind);
				}).toThrow(type="java.lang.IllegalArgumentException");
			});
		});
	}
}