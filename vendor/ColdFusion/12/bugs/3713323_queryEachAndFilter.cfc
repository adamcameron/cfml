component extends=testbox.system.BaseSpec {

	function run(){
		var originalList = "whero,karaka,kowhai,kakariki,kikorangi,poropango,papura";
		var originalQuery = originalList.listReduce(function(originalQuery, element, index){
			originalQuery.addRow([[index,element]]);
			return originalQuery;
		}, queryNew("id,colour"));

		describe("each() tests", function(){
			var expected = originalList.listReduce(function(expected, element, index){
				return expected.listAppend("#index#:#element#");
			}, "");

			it("works with .each()", function(){
				var result = "";
				originalQuery.each(function(){
					result = result.listAppend("#e.id#:#e.colour#");
				});
			});

			it("works with queryEach()", function(){
				var result = "";
				queryEach(originalQuery, function(e,i){
					result = result.listAppend("#e.id#:#e.colour#");
				});
				expect(result).toBe(expected);
			});
		});
 		describe("filter() tests", function(){
			var colour = "papura";
			var expected = queryExecute(
				"SELECT * FROM originalQuery WHERE colour = ?",
				[colour],
				{dbtype="query", originalQuery=originalQuery}
			);

			it("works with .filter()", function(){
				var result = originalQuery.filter(function(element){
					return element.colour == colour;
				});
				expect(result).toBe(expected);
			});

			it("works with queryFilter()", function(){
				var result = queryFilter(originalQuery, function(element){
					return element.colour == colour;
				});
				expect(result).toBe(expected);
			});
		});
	}
}