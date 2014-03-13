// TestExecutionSequence.cfc
component extends="testbox.system.testing.BaseSpec" {

	function beforeAll(){
		writeOutput("in beforeAll()<br>");
	}
	function afterAll(){
		writeOutput("in afterAll()<br>");
	}

	function run(){
		writeOutput("top of run()<br>");

		describe("outer describe", function(){
			writeOutput("top of outer describe()'s callback<br>");

			beforeEach(function(){
				writeOutput("in outer describe()'s beforeEach()<br>");
			});

			afterEach(function(){
				writeOutput("in outer describe()'s afterEach()<br>");
			});

			describe("inner describe", function(){
				writeOutput("top of inner describe()'s callback<br>");

				beforeEach(function(){
					writeOutput("in inner describe()'s beforeEach()<br>");
				});

				afterEach(function(){
					writeOutput("in inner describe()'s afterEach()<br>");
				});

				it("tests the negative", function(){
					writeOutput("top of inner describe()'s first it()'s callback<br>");
					expect(sgn(-1)).toBeLT(0);
					writeOutput("bottom of inner describe()'s first it()'s callback<br>");
				});

				writeOutput("bottom of inner describe()'s callback<br>");
			});

			it("tests the truth", function(){
				writeOutput("top of first it()'s callback<br>");
				expect(true).toBeTrue();
				writeOutput("bottom of first it()'s callback<br>");
			});

			it("tests falsehood", function(){
				writeOutput("top of second it()'s callback<br>");
				expect(false).notToBeTrue();
				writeOutput("bottom of second it()'s callback<br>");
			});

			writeOutput("bottom of outer describe()'s callback<br>");
		});


		describe("second outer describe", function(){
			writeOutput("top of second outer describe()'s callback<br>");

			it("tests the absolute", function(){
				writeOutput("top of second outer describe()'s first it()'s callback<br>");
				expect(abs(-1)).toBe(1);
				writeOutput("bottom of second outer describe()'s first it()'s callback<br>");
			});

			writeOutput("bottom of second outer describe()'s callback<br>");
		});

		writeOutput("bottom of run()<br>");
	}

}