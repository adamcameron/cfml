component extends=testbox.system.BaseSpec {

	function run(){
		describe("tests with nulls", function(){
			it("demonstrates a baseline test without the operator errors", function(){
				expect(function(){
					a.b.c.d;
				}).toThrow(message="Variable A is undefined.");
			});
			it("works with the same code as the baseline, just using the operator", function(){
				expect(function(){
					a?.b?.c?.d;
				}).notToThrow(message="Variable A is undefined.");
			});
			it("works when using a method returning null", function(){
				expect(function(){
					var nullFunction = function(){};
					nullFunction()?.b;
				}).notToThrow();
			});
			it("works when called on a null", function(){
				expect(function(){
					javacast("null", "")?.b;
				}).notToThrow();
			});
			it("works when using a native method", function(){
				expect(function(){
					a?.trim();
				}).notToThrow();
			});
		});
		describe("tests with not nulls", function(){
			it("works when the operand is not null", function(){
				var struct = {
					key = "value"
				};
				var result = struct?.key;
				expect(result).toBe(struct.key);
			});
		});
		describe("tests with incorrect usage", function(){
			it("works when the has a value, but is not a struct", function(){
				expect(function(){
					var struct = {
						key = "value"
					};
					var result = struct.key?.subkey;
				}).toThrow(message="You have attempted to dereference a scalar variable of type class java.lang.String as a structure with members.");
			});
		});
	}
}