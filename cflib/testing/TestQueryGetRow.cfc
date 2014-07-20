// TestQueryGetRow.cfc
component extends="testbox.system.BaseSpec" {

	function run(){
		include "udfs/queryGetRow.cfm"; // renamed to _queryGetRow() for tests, as I'm running CF11

		describe("Tests for convertBBCodeToHtml()", function(){
			it("handles an empty query", function(){
				expect(
					_queryGetRow(queryNew(""), 0)
				).toBe({});
			});
			it("handles zeroth row from a one-row query", function(){
				var q = queryNew("col", "varchar", [["data"]]);
				expect(
					_queryGetRow(q, 0)
				).toBe({col=""});
			});
			it("handles first row from a one-row query", function(){
				var q = queryNew("col", "varchar", [["data"]]);
				expect(
					_queryGetRow(q, 1)
				).toBe({col="data"});
			});
			it("handles row with multiple columns", function(){
				var q = queryNew("col1,col2", "varchar,varchar", [["data1","data2"]]);
				expect(
					_queryGetRow(q, 1)
				).toBe({col1="data1",col2="data2"});
			});
		});
	}

}