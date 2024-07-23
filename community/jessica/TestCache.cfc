// TestCache.cfc

component extends=testbox.system.BaseSpec {

	function run(){
		describe("setProperty() tests", function(){


			it("fulfils the specified requirement", function(){
				var cache = new Cache({foo={bar="hi"}});
				cache.setProperty("foo.bar", "chicken");

				var result = cache.cached.foo.bar;
				expect(result).toBe("chicken");
			});


			it("works with a deeper struct", function(){
				var original = {
					first = {
						second = {
							third = ""
						}
					}
				};
				var value = "fourth";

				var expected = duplicate(original);
				expected.first.second.third = value;

				var cache = new Cache(original);
				cache.setProperty("first.second.third", value);

				var result = cache.cached;
				expect(result).toBe(expected);
			});


			it("doesn't interfere with adjacent data", function(){
				var original = {
					first = {
						second = {
							third = "",
							thirdBis = "thirdBis"
						},
						secondBis = "secondBis"
					},
					firstBis = "firstBis"
				};
				var value = "fourth";

				var expected = duplicate(original);
				expected.first.second.third = value;

				var cache = new Cache(original);
				cache.setProperty("first.second.third", value);

				var result = cache.cached;
				expect(result).toBe(expected);
			});
		});

		describe("protected elements tests", function(){

			it("protects the bottom element", function(){
				expect(function(){
					var cache = new Cache({foo={bar="hi"}});
					cache.protected = ["bar"];

					cache.setProperty("foo.bar", "chicken");
				}).toThrow("ProtectionException");
			});


			it("protects the top element", function(){
				expect(function(){
					var cache = new Cache({foo={bar="hi"}});
					cache.protected = ["foo"];

					cache.setProperty("foo.bar", "chicken");
				}).toThrow("ProtectionException");
			});


			it("protects multiple elements", function(){
				var original = {
					top = {
						block1 = {
							key = "value"
						},
						middle = {
							block2 = {
								lower = {
									key = "value"
								}
							} 
						}
					}
				};
				var value = "updated";

				var cache = new Cache(original);
				cache.protected = ["block1", "block2"]

				expect(function(){
					cache.setProperty("top.block1.key", "updated");
				}).toThrow("ProtectionException");

				expect(function(){
					cache.setProperty("top.middle.block2.lower.key", "updated");
				}).toThrow("ProtectionException");
			});


			it("doesn't interfere with non-protected elememts", function(){
				expect(function(){
					var cache = new Cache({foo={bar="hi"}});
					cache.protected = ["baz"];

					cache.setProperty("foo.bar", "chicken");
				}).notToThrow("ProtectionException");
			});

		});
	}

}