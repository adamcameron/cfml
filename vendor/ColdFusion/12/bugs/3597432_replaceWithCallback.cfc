https://bugbase.adobe.com/index.cfm?event=bug&id=3597432
component extends=testbox.system.BaseSpec {

	function run(){

		describe("implementation tests", function(){
			it("has been implemented in replace()", function(){
				expect(function(){
					replace("source to find match", "match", function(){
						return "replacement";
					});
				}).notToThrow();
			});
			it("has been implemented in replaceNoCase()", function(){
				expect(function(){
					throw(type="NotImplementedException", message="Causes parser error if used with a callback");
				}).notToThrow();
			});
			it("has been implemented in reReplace()", function(){
				expect(function(){
					throw(type="NotImplementedException", message="Causes parser error if used with a callback");
				}).notToThrow();
			});
			it("has been implemented in reReplaceNoCase()", function(){
				expect(function(){
					throw(type="NotImplementedException", message="Causes parser error if used with a callback");
				}).notToThrow();
			});
		});
		describe("replace() function tests", function(){
			describe("simple value tests", function(){
				it("makes a single simple replacement", function(){
					var needle = "match";
					var haystack = "source to find match";
					var replacement = "REPLACEMENT";
					var expected = "source to find REPLACEMENT";

					var result = replace(haystack, needle, function(needle, index, haystack){
						return replacement;
					});	
					expect(result).toBe(expected);			
				});
				it("makes multiple simple replacements", function(){
					var needle = "match";
					var haystack = "source to find one match then another match in";
					var replacement = "REPLACEMENT";
					var expected = "source to find one REPLACEMENT then another REPLACEMENT in";

					var result = replace(haystack, needle, function(needle, index, haystack){
						return replacement;
					}, "all");	
					expect(result).toBe(expected);			
				});
			});
		});
		describe(".replace() method tests", function(){
			describe("simple value tests", function(){
				it("makes a single simple replacement", function(){
					var needle = "match";
					var haystack = "source to find match";
					var replacement = "REPLACEMENT";
					var expected = "source to find REPLACEMENT";

					var result = haystack.replace(needle, function(needle, index, haystack){
						return replacement;
					});	
					expect(result).toBe(expected);			
				});
				it("makes multiple simple replacements", function(){
					var needle = "match";
					var haystack = "source to find one match then another match in";
					var replacement = "REPLACEMENT";
					var expected = "source to find one REPLACEMENT then another REPLACEMENT in";

					var result = haystack.replace(needle, function(needle, index, haystack){
						return replacement;
					}, "all");	
					expect(result).toBe(expected);			
				});
			});
			describe("regex value tests", function(){
				it("makes a single regex replacement", function(){
					var needle = "\b\w{5}\b";
					var haystack = "source to find match";
					var replacement = "REPLACEMENT";
					var expected = "source to find REPLACEMENT";

					var result = haystack.replace(needle, function(needle, index, haystack){
						return replacement;
					});	
					expect(result).toBe(expected);			
				});
				it("makes multiple regex replacements", function(){
					var needle = "\b\w{5}\b";
					var haystack = "source to find one match then another match in";
					var replacement = "REPLACEMENT";
					var expected = "source to find one REPLACEMENT then another REPLACEMENT in";

					var result = haystack.replace(needle, function(needle, index, haystack){
						return replacement;
					}, "all");	
					expect(result).toBe(expected);			
				});
			});
		});
		describe("replaceNoCase() function tests", function(){
			describe("simple value tests", function(){
				var simpleReplacer = function(needle, index, haystack){
					return replacement;
				};
				it("makes a single simple replacement", function(){
					var needle = "MATCH";
					var haystack = "source to find match";
					var replacement = "REPLACEMENT";
					var expected = "source to find REPLACEMENT";

					var result = replaceNoCase(haystack, needle, simpleReplacer);	
					expect(result).toBe(expected);			
				});
				it("makes multiple simple replacements", function(){
					var needle = "MATCH";
					var haystack = "source to find one match then another match in";
					var replacement = "REPLACEMENT";
					var expected = "source to find one REPLACEMENT then another REPLACEMENT in";

					var result = replace(haystack, needle, simpleReplacer, "all");	
					expect(result).toBe(expected);			
				});
			});
		});
	}
}
