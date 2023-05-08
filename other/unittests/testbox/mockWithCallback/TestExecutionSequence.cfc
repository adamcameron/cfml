// TestExecutionSequence.cfc
component extends="testbox.system.testing.BaseSpec" {

	function beforeAll(){
		writeLog(file="testBoxExecutionOrder", text="in beforeAll()<br>");
	}
	function afterAll(){
		writeLog(file="testBoxExecutionOrder", text="in afterAll()<br>");
	}

	function run(){
		writeLog(file="testBoxExecutionOrder", text="top of run()<br>");

		describe("outer describe", function(){
			writeLog(file="testBoxExecutionOrder", text="top of outer describe()'s callback<br>");

			beforeEach(function(){
				writeLog(file="testBoxExecutionOrder", text="in outer describe()'s beforeEach()<br>");
			});

			afterEach(function(){
				writeLog(file="testBoxExecutionOrder", text="in outer describe()'s afterEach()<br>");
			});

			describe("inner describe", function(){
				writeLog(file="testBoxExecutionOrder", text="top of inner describe()'s callback<br>");

				beforeEach(function(){
					writeLog(file="testBoxExecutionOrder", text="in inner describe()'s beforeEach()<br>");
				});

				afterEach(function(){
					writeLog(file="testBoxExecutionOrder", text="in inner describe()'s afterEach()<br>");
				});

				it("tests the negative", function(){
					writeLog(file="testBoxExecutionOrder", text="top of inner describe()'s first it()'s callback<br>");
					expect(sgn(-1)).toBeLT(0);
					writeLog(file="testBoxExecutionOrder", text="bottom of inner describe()'s first it()'s callback<br>");
				});

				writeLog(file="testBoxExecutionOrder", text="bottom of inner describe()'s callback<br>");
			});

			it("tests the truth", function(){
				writeLog(file="testBoxExecutionOrder", text="top of first it()'s callback<br>");
				expect(true).toBeTrue();
				writeLog(file="testBoxExecutionOrder", text="bottom of first it()'s callback<br>");
			});

			it("tests falsehood", function(){
				writeLog(file="testBoxExecutionOrder", text="top of second it()'s callback<br>");
				expect(false).notToBeTrue();
				writeLog(file="testBoxExecutionOrder", text="bottom of second it()'s callback<br>");
			});

			writeLog(file="testBoxExecutionOrder", text="bottom of outer describe()'s callback<br>");
		});


		describe("second outer describe", function(){
			writeLog(file="testBoxExecutionOrder", text="top of second outer describe()'s callback<br>");

			it("tests the absolute", function(){
				writeLog(file="testBoxExecutionOrder", text="top of second outer describe()'s first it()'s callback<br>");
				expect(abs(-1)).toBe(1);
				writeLog(file="testBoxExecutionOrder", text="bottom of second outer describe()'s first it()'s callback<br>");
			});

			writeLog(file="testBoxExecutionOrder", text="bottom of second outer describe()'s callback<br>");
		});

		writeLog(file="testBoxExecutionOrder", text="bottom of run()<br>");
	}

}