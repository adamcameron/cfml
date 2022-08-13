// https://bugbase.adobe.com/index.cfm?event=bug&id=3321666

component extends=testbox.system.basespec {

	function run(){
		var haystack = "We will try to find all the four letter words in this sentence.";

		describe("regression tests", function(){
			describe("no subexpressions tests (inferred)", function(){
				var pattern = "\b\w{4}\b";
				var expected = 4;

				it("reFind() works as previous with no scope argument", function(){
					var result = reFind(pattern, haystack);

					expect(result).toBe(expected);
				});
				it("reFindNoCase() works as previous with no scope argument", function(){
					var result = reFindNoCase(pattern, haystack);

					expect(result).toBe(expected);
				});
				it(".reFind() works as previous with no scope argument", function(){
					var result = haystack.reFind(pattern);

					expect(result).toBe(expected);
				});
				it(".reFindNoCase() works as previous with no scope argument", function(){
					var result = haystack.reFindNoCase(pattern);

					expect(result).toBe(expected);
				});
			});
	
			describe("no subexpressions tests (explicit)", function(){
				var pattern = "\b\w{4}\b";
				var expected = 4;

				it("reFind() works as previous with no scope argument", function(){
					var result = reFind(pattern, haystack, 1, false);

					expect(result).toBe(expected);
				});
				it("reFindNoCase() works as previous with no scope argument", function(){
					var result = reFindNoCase(pattern, haystack, 1, false);

					expect(result).toBe(expected);
				});
				it(".reFind() works as previous with no scope argument", function(){
					var result = haystack.reFind(pattern, 1, false);

					expect(result).toBe(expected);
				});
				it(".reFindNoCase() works as previous with no scope argument", function(){
					var result = haystack.reFindNoCase(pattern, 1, false);

					expect(result).toBe(expected);
				});
			});
	
			describe("subexpression tests", function(){
				var pattern = "\b(\w{4})\b";
				var expected = {pos=[4,4], len=[4,4]};
				var testExpectations = function(result, expected){
					expect(result.len).toBe(expected.len);
					expect(result.pos).toBe(expected.pos);
				};

				it("reFind() works as previous with no scope argument", function(){
					var result = reFind(pattern, haystack, 1, true);

					testExpectations(result, expected);
				});
				it("reFindNoCase() works as previous with no scope argument", function(){
					var result = reFindNoCase(pattern, haystack, 1, true);

					testExpectations(result, expected);
				});
				it(".reFind() works as previous with no scope argument", function(){
					var result = haystack.reFind(pattern, 1, true);

					testExpectations(result, expected);
				});
				it(".reFindNoCase() works as previous with no scope argument", function(){
					var result = haystack.reFindNoCase(pattern, 1, true);

					testExpectations(result, expected);
				});
			});
		});
		describe("single matches", function(){
			var testExpectations = function(result, expected){
				expect(result.len).toBe(expected.len);
				expect(result.pos).toBe(expected.pos);
				expect(result.match).toBe(expected.match);
			};
			describe("Pattern with no subexpression capture", function(){
				var pattern = "\b\w{4}\b";
				var expected = {pos=[4], len=[4], match=["will"]};

				it("returns expected pos,len,match when using reFind()", function(){
					var result = reFind(pattern, haystack, 1, true, "ONE");

					testExpectations(result, expected);
				});
				it("returns expected pos,len,match when using reFindNoCase()", function(){
					var result = reFindNoCase(pattern, haystack, 1, true, "ONE");

					testExpectations(result, expected);
				});
				it("returns expected pos,len,match when using .reFind()", function(){
					var result = haystack.reFind(pattern, 1, true, "ONE");

					testExpectations(result, expected);
				});
				it("returns expected pos,len,match when using .reFindNoCase()", function(){
					var result = haystack.reFindNoCase(pattern, 1, true, "ONE");

					testExpectations(result, expected);
				});
			});
			describe("Pattern with subexpression capture", function(){
				var pattern = "\b(\w{4})\b";
				var expected = {pos=[4,4], len=[4,4], match=["will", "will"]};

				it("returns expected pos,len,match when using reFind()", function(){
					var result = reFind(pattern, haystack, 1, true, "ONE");

					testExpectations(result, expected);
				});
				it("returns expected pos,len,match when using reFindNoCase()", function(){
					var result = reFindNoCase(pattern, haystack, 1, true, "ONE");

					testExpectations(result, expected);
				});
				it("returns expected pos,len,match when using .reFind()", function(){
					var result = haystack.reFind(pattern, 1, true, "ONE");

					testExpectations(result, expected);
				});
				it("returns expected pos,len,match when using .reFindNoCase()", function(){
					var result = haystack.reFindNoCase(pattern, 1, true, "ONE");

					testExpectations(result, expected);
				});
			});
		});
		describe("multiple matches", function(){
			var testExpectations = function(results, expected){
				results.each(function(result, index){
					expect(result.len).toBe(expected[index].len);
					expect(result.pos).toBe(expected[index].pos);
					expect(result.match).toBe(expected[index].match);
				});
			};
			describe("Pattern with no subexpression capture", function(){
				var pattern = "\b\w{4}\b";
				var expected = [
					{pos=[4], len=[4], match=["will"]},
					{pos=[16], len=[4], match=["find"]},
					{pos=[29], len=[4], match=["four"]},
					{pos=[50], len=[4], match=["this"]}
				];

				it("returns expected pos,len,match when using reFind()", function(){
					var results = reFind(pattern, haystack, 1, true, "ALL");
					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using reFindNoCase()", function(){
					var results = reFindNoCase(pattern, haystack, 1, true, "ALL");

					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using .reFind()", function(){
					var results = haystack.reFind(pattern, 1, true, "ALL");

					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using .reFindNoCase()", function(){
					var results = haystack.reFindNoCase(pattern, 1, true, "ALL");

					testExpectations(results, expected);
				});
			});
			describe("Pattern with subexpression capture", function(){
				var pattern = "\b(\w{4})\b";
				var expected = [
					{pos=[4], len=[4], match=["will"]},
					{pos=[16], len=[4], match=["find"]},
					{pos=[29], len=[4], match=["four"]},
					{pos=[50], len=[4], match=["this"]}
				];

				it("returns expected pos,len,match when using reFind()", function(){
					var results = reFind(pattern, haystack, 1, true, "ALL");

					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using reFindNoCase()", function(){
					var results = reFindNoCase(pattern, haystack, 1, true, "ALL");

					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using .reFind()", function(){
					var results = haystack.reFind(pattern, 1, true, "ALL");

					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using .reFindNoCase()", function(){
					var results = haystack.reFindNoCase(pattern, 1, true, "ALL");

					testExpectations(results, expected);
				});
			});
			describe("Pattern with multiple subexpression capture", function(){
				var pattern = "\b((\w{2})(\w{2}))\b";
				var expected = [
					{pos=[4,4,4,6], len=[4,4,2,2], match=["will", "will", "wi", "ll"]},
					{pos=[16,16,16,18], len=[4,4,2,2], match=["find", "find", "fi", "nd"]},
					{pos=[29,29,29,31], len=[4,4,2,2], match=["four", "four", "fo", "ur"]},
					{pos=[50,50,50,52], len=[4,4,2,2], match=["this", "this", "th", "is"]}
				];

				it("returns expected pos,len,match when using reFind()", function(){
					var results = reFind(pattern, haystack, 1, true, "ALL");

					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using reFindNoCase()", function(){
					var results = reFindNoCase(pattern, haystack, 1, true, "ALL");

					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using .reFind()", function(){
					var results = haystack.reFind(pattern, 1, true, "ALL");

					testExpectations(results, expected);
				});
				it("returns expected pos,len,match when using .reFindNoCase()", function(){
					var results = haystack.reFindNoCase(pattern, 1, true, "ALL");

					testExpectations(results, expected);
				});
			});
		});
	}
}