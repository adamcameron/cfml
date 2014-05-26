// TestFirstDayOfWeek.cfc
component extends="testbox.system.testing.BaseSpec" {

	function beforeAll(){
		include "udfs/titleCaseList.cfm";
	}

	function run(){
		describe("Tests for titleCaseList()", function(){
			describe("Tests with default delimiter", function(){
				it("works with an empty string", function(){
					expect(
						titleCaseList("")
					).toBeWithCase("");
				});
				it("works with no delimiter in string", function(){
					expect(
						titleCaseList("a")
					).toBeWithCase("A");
				});
				it("works with delimiter in string", function(){
					expect(
						titleCaseList("a b c")
					).toBeWithCase("A B C");
				});
			});

		});
	}

}