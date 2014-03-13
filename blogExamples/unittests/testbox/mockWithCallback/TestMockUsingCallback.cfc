// TestMockUsingCallback.cfc
component extends="testbox.system.testing.BaseSpec" {

	function beforeAll(){
		variables.testInstance = new C();

		$mockbox.prepareMock(testInstance);
		testInstance.$("getId").$callback(function(){
			return createUuid();
		});

		testInstance.$("getTomorrow").$callback(mockedGetTomorrow);

		testInstance.$("emphasiseString").$callback(function(s){
			return "<em>#s#</em>";
		});
	}

	function run(){
		describe("Test getStructWithUniqueKeys() which has had its call to getId() mocked-out", function(){
			it("returns a correctly-sized struct", function(){
				var iterations = 10;
				var result = testInstance.getStructWithUniqueKeys(iterations);

				expect(structCount(result)).toBe(iterations);
			});
		});

		describe("Test getTomorrow(), which has been mocked with a predefined-function not a function expression", function(){
			it("returns returns tomorrow's date", function(){
				expect(
					dateCompare(now()+1, testInstance.getTomorrow(), "d")
				).toBe(0);
			});
		});

		describe("Test mocked emphasiseString(), which takes an argument", function(){
			it("uses the argument", function(){
				var result =  testInstance.emphasiseString("G'day World");
				expect(result).toBe("<em>G'day World</em>");
			});
		});
	}

	private function mockedGetTomorrow(){
		return dateAdd("d", 1, now());
	}

}