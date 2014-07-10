// TestListContains.cfc
component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		variables.list = "tahi,rua,toru,wha";
	}

	function run(){
		describe("Tests for listContains()", function(){
			it("finds an exact match", function(){
				expect(listContains(list, "toru")).toBeTrue();
			});
			it("finds a partial match", function(){
				expect(listContains(list, "to")).toBeTrue();
			});
		});
		describe("Tests for listFind()", function(){
			it("finds an exact match", function(){
				expect(listFind(list, "toru")).toBeTrue();
			});
			it("doesn't find a partial match", function(){
				expect(listFind(list, "to")).toBeFalse();
			});
		});
	}
}