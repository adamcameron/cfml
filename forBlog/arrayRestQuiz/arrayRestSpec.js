// arrayRestSpec.js

require('jasmine-expect');

var arrayRest = require("./arrayRest.js");

describe("arrayRest() tests", function(){
	describe("TDD tests", function(){
		it("returns an array", function(){
			var result = arrayRest([]);
			expect(result).toBeArray();
		});
		describe("array length tests", function(){
			it("returns the correct-lengthed array when passed a zero-element array", function(){
				var input = [];
				var result = arrayRest([]);

				expect(result.length).toBe(input.length);
			});
			it("returns the correct-lengthed array when passed a one-element array", function(){
				var input = ["a"];
				var result = arrayRest(input);

				expect(result).toBeArrayOfSize(input.length);
			});
			it("returns the correct-lengthed array when passed a multiple-element array", function(){
				var input = ["a", "b", "c"];
				var result = arrayRest(input);

				expect(result).toBeArrayOfSize(input.length);
			});
		});
		describe("element tests", function(){
			var input = ["a", "b", "c", "d"];
			it("returns an array with the expected elements", function(){
				var result = arrayRest(input);

				result.forEach(function(element, index){
					expect(element).toBeArray();
					expect(element).toBeArrayOfSize(input.length - index);
				});
			});
		});
	});
	describe("requirement tests", function(){
		it("returns the correct array", function(){
			var input = ["a", "b", "c", "d", "e"];
			var expected = [
				["a", "b", "c", "d", "e"],
				["b", "c", "d", "e"],
				["c", "d", "e"],
				["d", "e"],
				["e"]
			];
			var result = arrayRest(input);
			expect(result).toEqual(expected);
		});
	});
});