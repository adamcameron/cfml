// TestExecutionSequence.cfc
component extends="testbox.system.testing.BaseSpec" {

	function beforeAll(){
		writeLog(file="testbox2", text="top of beforeAll()<br>");
		writeLog(file="testbox2", text="bottom of beforeAll()<br>");
	}

	function run(){
		writeLog(file="testbox2", text="top of run()<br>");
		describe("description", function(){
			writeLog(file="testbox2", text="top of describe()'s handler<br>");
			it("tests the truth", function(){
				writeLog(file="testbox2", text="top of it()'s handler<br>");
				expect(true).toBeTrue();
				writeLog(file="testbox2", text="bottom of it()'s handler<br>");
			});
			writeLog(file="testbox2", text="bottom of describe()'s handler<br>");
		});
		writeLog(file="testbox2", text="bottom of run()<br>");
	}

}