component extends=testbox.system.BaseSpec {

	function run(){
		describe("Regression tests", function(){
			it("does not impact structAppend()", function(){
				var original = {};
				var append = {one="tahi"};
				var result = structAppend(original, append);
				expect(result).toBetrue();
			});

			it("does not impact arrayAppend() appending an element", function(){
				var original = [];
				var append = "toru";
				var result = arrayAppend(original, append);
				expect(result).toBeTrue();

			});

			it("does not impact arrayAppend() appending an array", function(){
				var original = [];
				var append = ["toru"];
				var result = arrayAppend(original, append, true);
				expect(result).toBeTrue();

			});
		});

		describe(".append() tests", function(){
			it("works with Struct.append()", function(){
				var original = {};
				var expected = {one="tahi"};
				var result = original.append(expected);
				expect(result).toBe(expected);

			});


			it("works with Array.append() appending element", function(){
				var original = [];
				var expected = "rua";
				var result = original.append(expected);
				expect(result).toBe([expected]);

			});

			it("works with Array.append() appending array", function(){
				var original = [];
				var expected = ["toru"];
				var result = original.append(expected, true);
				expect(result).toBe(expected);

			});
		});
	}
}