// TestExecutionSequenceSimplifed.cfc
component extends="testbox.system.testing.BaseSpec" {

	function beforeAll(){
		writeLog(file=application.applicationname, text="in beforeAll()");
	}
	function afterAll(){
		writeLog(file=application.applicationname, text="in afterAll()");
	}

	function run(){
		writeLog(file=application.applicationname, text="top of run()");

		describe("describe", function(){
			writeLog(file=application.applicationname, text="top of describe()'s callback");

			beforeEach(function(){
				writeLog(file=application.applicationname, text="in describe()'s beforeEach()");
			});

			afterEach(function(){
				writeLog(file=application.applicationname, text="in describe()'s afterEach()");
			});


			it("tests the truth", function(){
				writeLog(file=application.applicationname, text="top of first it()'s callback");
				expect(true).toBeTrue();
				writeLog(file=application.applicationname, text="bottom of first it()'s callback");
			});

			it("tests falsehood", function(){
				writeLog(file=application.applicationname, text="top of second it()'s callback");
				expect(false).notToBeTrue();
				writeLog(file=application.applicationname, text="bottom of second it()'s callback");
			});

			writeLog(file=application.applicationname, text="bottom of describe()'s callback");
		});
		writeLog(file=application.applicationname, text="bottom of run()");
	}

}