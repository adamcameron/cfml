component extends=testbox.system.BaseSpec {

	baselineQuery = queryNew("number", "varchar", [["tahi"],["rua"],["toru"],["wha"]]);
	numberValues = valueList(baselineQuery.number);
	newColumnArray = numberValues.listReduce(function(values, value, index){
		values.append(index);
		return values;
	}, []);

	function run(){
		describe("Regression tests", function(){
			it("works with setCell()", function(){
				var testQuery = getTestQuery();
				testQuery.setCell("number", "one", 1);
				expect(testQuery.number[1]).toBe("one");				
			});
			it("works with querySetCell()", function(){
				var testQuery = getTestQuery();
				querySetCell(testQuery, "number", "two", 2);
				expect(testQuery.number[2]).toBe("two");				
			});
			it("works with addColumn()", function(){
				var testQuery = getTestQuery();
				testQuery.addColumn("id", "integer", newColumnArray);
				expect(valueList(testQuery.id)).toBe(newColumnArray.toList());				
			});
			it("works with queryAddColumn()", function(){
				var testQuery = getTestQuery();
				queryAddColumn(testQuery, "id", "integer", newColumnArray);
				expect(valueList(testQuery.id)).toBe(newColumnArray.toList());				
			});
		});
		describe("Mutability tests", function(){
			describe("Mutable tests", function(){
				it("works with setCell()", function(){
					var testQuery = getTestQuery(true);
					testQuery.setCell("number", "one", 1);
					expect(testQuery.number[1]).toBe("one");				
				});
				it("works with querySetCell()", function(){
					var testQuery = getTestQuery(true);
					querySetCell(testQuery, "number", "two", 2);
					expect(testQuery.number[2]).toBe("two");				
				});
				it("works with addColumn()", function(){
					var testQuery = getTestQuery(true);
					testQuery.addColumn("id", "integer", newColumnArray);
					expect(valueList(testQuery.id)).toBe(newColumnArray.toList());				
				});
				it("works with queryAddColumn()", function(){
					var testQuery = getTestQuery(true);
					queryAddColumn(testQuery, "id", "integer", newColumnArray);
					expect(valueList(testQuery.id)).toBe(newColumnArray.toList());				
				});
				it("becomes mutable when undocumented setMutable() method is used", function(){
					expect(function(){
						var testQuery = getTestQuery(false);
						testQuery.setMutable(true);
						queryAddColumn(testQuery, "id", "integer", newColumnArray);
					}).notToThrow(message="Query object being modified is not mutable");
				});
			});
			describe("Immutable tests", function(){
				it("doesn't work with setCell()", function(){
					expect(function(){
						var testQuery = getTestQuery(false);
						testQuery.setCell("number", "one", 1);
					}).toThrow(message="Query object being modified is not mutable");
				});
				it("doesn't work with querySetCell()", function(){
					expect(function(){
						var testQuery = getTestQuery(false);
						querySetCell(testQuery, "number", "two", 2);
					}).toThrow(message="Query object being modified is not mutable");
				});
				it("doesn't work with addColumn()", function(){
					expect(function(){
						var testQuery = getTestQuery(false);
						testQuery.addColumn("id", "integer", newColumnArray);
					}).toThrow(message="Query object being modified is not mutable");
				});
				it("doesn't work with queryAddColumn()", function(){
					expect(function(){
						var testQuery = getTestQuery(false);
						queryAddColumn(testQuery, "id", "integer", newColumnArray);
					}).toThrow(message="Query object being modified is not mutable");
				});
				it("becomes immutable when undocumented setMutable() method is used", function(){
					expect(function(){
						var testQuery = getTestQuery(true);
						testQuery.setMutable(false);
						queryAddColumn(testQuery, "id", "integer", newColumnArray);
					}).toThrow(message="Query object being modified is not mutable");
				});
			});
		});
		describe("Type tests", function(){
			var testQuery = getTestQuery(false);
			it("is of type", function(){
				var class = testQuery.getClass().getName();
				expect(class).toBe("coldfusion.sql.QueryTable");
			});
		});
	}

	function getTestQuery(mutable){
		var settings = {
			dbtype = "query",
			baselineQuery = baselineQuery
		};
		if (structKeyExists(arguments, "mutable")){
			settings.mutable = arguments.mutable;
		}
		return queryExecute("SELECT number FROM baselineQuery", [], settings);
	}

}