component extends=testbox.system.BaseSpec {

	/**
	* @x.type numeric
	* @x.default 54
	*/
	function f(x){
		return x;
	}

	function run(){
		describe("function annotations test", function(){
			it("reads the default", function(){
				var result = f();
				expect(result).toBe(54);
			});
			it("allows the default to be overriden", function(){
				var expected = 70;
				var result = f(expected);
				expect(result).toBe(expected);
			});
			it("respects the type when set via annotation", function(){
				expect(function(){
					f("invalid");
				}).tothrow(message="The X argument passed to the f function is not of type numeric.");
			});
		});
	}
}