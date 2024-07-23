component extends=testbox.system.BaseSpec {

	baseArray = ["tahi","rua","toru","wha"];

	function run(){
		describe("cfloop tests with arrays", function(){
			it("index by itself still works", function(){
				var index = "";
				var result = "";
				var expected = baseArray.toList();
				include "array/indexOnly.cfm";
				expect(result).toBe(expected);
			});
			it("item by itself works", function(){
				var item = "";
				var result = "";
				var expected = baseArray.toList();
				include "array/itemOnly.cfm";
				expect(result).toBe(expected);
			});
			it("both index and item work", function(){
				var index = 0;
				var item = "";
				var result = "";
				var expected = baseArray.reduce(function(expected,element,index){
					return expected.listAppend("#index#:#element#");
				}, "");
				include "array/indexAndItem.cfm";
				expect(result).toBe(expected);
			});
		});
		describe("cfloop tests with lists", function(){
			var baseList = baseArray.toList();

			it("index by itself still works", function(){
				var index = "";
				var result = "";
				var expected = baseArray.toList();
				include "list/indexOnly.cfm";
				expect(result).toBe(expected);
			});
			it("item by itself works", function(){
				var item = "";
				var result = "";
				var expected = baseArray.toList();
				include "list/itemOnly.cfm";
				expect(result).toBe(expected);
			});
			it("both index and item work", function(){
				var index = 0;
				var item = "";
				var result = "";
				var expected = baseArray.reduce(function(expected,element,index){
					return expected.listAppend("#index#:#element#");
				}, "");
				include "list/indexAndItem.cfm";
				expect(result).toBe(expected);
			});
		});
		describe("cfloop tests with struct", function(){
			var baseStruct = baseArray.reduce(function(baseStruct, element, index){
				baseStruct[index] = element;
				return baseStruct;
			}, {});

			it("index by itself works", function(){
				var index = "";
				var result = "";
				var expected = baseArray.toList();
				include "struct/indexOnly.cfm";
				expect(result).toBe(expected);
			});
			it("item by itself still works", function(){
				var item = "";
				var result = "";
				var expected = baseArray.reduce(function(expected, element, key){
					return expected.listAppend(key);
				},"");
				include "struct/itemOnly.cfm";
				expect(result).toBe(expected);
			});
			it("both index and item work", function(){
				var index = 0;
				var item = "";
				var result = "";
				var expected = baseArray.reduce(function(expected,element,index){
					return expected.listAppend("#index#:#element#");
				}, "");
				include "struct/indexAndItem.cfm";
				expect(result).toBe(expected);
			});
		});
		describe("cfloop tests with query", function(){
			var baseQuery = baseArray.reduce(function(baseQuery, element, index){
				baseQuery.addRow();
				baseQuery.setCell("index", index);
				baseQuery.setCell("element", element);
				return baseQuery;
			}, queryNew("index,element"));
			var expected = baseArray.reduce(function(expected,element,index){
				return expected.listAppend("#index#:#element#");
			}, "");

			it("index by itself works", function(){
				var index = "";
				var result = "";
				include "query/indexOnly.cfm";
				expect(result).toBe(expected);
			});
			it("item by itself works", function(){
				var item = "";
				var result = "";
				include "query/itemOnly.cfm";
				expect(result).toBe(expected);
			});
			it("both index and item work", function(){
				var index = 0;
				var item = "";
				var result = "";
				include "query/indexAndItem.cfm";
				expect(result).toBe(expected);
			});
		});
		describe("cfloop tests with file", function(){
			var baseFile = expandPath("file/test.txt");

			it("index by itself still works", function(){
				var index = "";
				var result = "";
				var expected = baseArray.toList();
				include "file/indexOnly.cfm";
				expect(result).toBe(expected);
			});
			it("item by itself works", function(){
				var item = "";
				var result = "";
				var expected = baseArray.toList();
				include "file/itemOnly.cfm";
				expect(result).toBe(expected);
			});
			it("both index and item work", function(){
				var index = 0;
				var item = "";
				var result = "";
				var expected = baseArray.reduce(function(expected,element,index){
					return expected.listAppend("#index#:#element#");
				}, "");
				include "file/indexAndItem.cfm";
				expect(result).toBe(expected);
			});
		});
	}
}