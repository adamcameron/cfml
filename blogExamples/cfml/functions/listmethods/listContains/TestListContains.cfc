// TestListContains.cfc
component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		variables.list = "tahi,rua,toru,wha";
	}

	function run(){
		describe("Tests for listContains()", function(){
			it("finds an exact match", function(){
				expect(listContains(list, "tahi")).toBe(1);
			});
			it("finds a partial match", function(){
				expect(listContains(list, "to")).toBe(3);
			});
		});
		describe("Tests for listFind()", function(){
			it("finds an exact match", function(){
				expect(listFind(list, "rua")).toBe(2);
			});
			it("doesn't find a partial match", function(){
				expect(listFind(list, "to")).toBe(0);
			});
		});
	}
}