//builtInFunctions.cfm
component {
	pageEncoding "utf-8"; // there's a ß, further down
		
	function run(){
		describe("structAppend() tests", function(){
			it("appends two empty structs", function(){
				var initialStruct = {};
				structAppend(initialStruct, {});
				expect(initialStruct).toBe({});
			});
			it("appends a new key to an empty struct", function(){
				var initialStruct = {};
				var structWithNewKey = {a="b"};
				structAppend(initialStruct, structWithNewKey);
				expect(initialStruct).toBe(structWithNewKey);
			});
			it("appends a new key to a struct with an existing key", function(){
				var initialStruct = {a="b"};
				var structWithNewKey = {c="d"};
				structAppend(initialStruct, structWithNewKey);
				expect(initialStruct).toBe({a="b",c="d"});
			});
			it("by default overwrites a key's value in a struct with a new value from the appended struct", function(){
				var initialStruct = {a="be"};
				var structWithNewKey = {a="bee"};
				structAppend(initialStruct, structWithNewKey);
				expect(initialStruct).toBe({a="bee"});
			});
			it("will not overwrite a key's value in a struct with a new value from the appended struct if the overwriteFlag is set to false", function(){
				var initialStruct = {a="be"};
				var structWithNewKey = {a="bee"};
				structAppend(initialStruct, structWithNewKey, false);
				expect(initialStruct).toBe({a="be"});
			});
		});

		describe("structClear() tests", function(){
			it("clears a struct", function(){
				var initialStruct = {a="b"};
				structClear(initialStruct);
				expect(initialStruct).toBe({});
			});
			it("returns false if the struct was not cleared", function(){
				var initialStruct = CGI;
				var result = structClear(initialStruct);
				expect(result).toBeTrue();
			});
		});

		describe("structCopy() tests", function(){
			it("copies a struct", function(){
				var initialStruct = {a="b"};
				var newStruct = structCopy(initialStruct);
				expect(newStruct).toBe(initialStruct);
			});
			it("copies deep structs by reference", function(){
				var initialStruct = {a="b", c={d={e="f"}}};
				var result = structCopy(initialStruct);

				initialStruct.c.d.e = "g";
				expect(result).toBe(initialStruct);
			});
		});

		describe("structCount() tests", function(){
			it("counts keys in a struct", function(){
				var testStruct = {a="b", c="d"};
				var count = structCount(testStruct);
				expect(count).toBe(2);
			});
		});

		describe("structDelete() tests", function(){
			it("deletes a key from a struct", function(){
				var testStruct = {a="b", c="d"};
				structDelete(testStruct, "c");
				expect(testStruct).toBe({a="b"});
			});
			it("returns true if the indicatenotexisting argument is default", function(){
				var testStruct = {a="b", c="d"};
				var result = structDelete(testStruct, "c");
				expect(result).toBeTrue();

				result = structDelete(testStruct, "d");
				expect(result).toBeTrue();
			});
			it("returns true if the indicatenotexisting argument is true and the key existed", function(){
				var testStruct = {a="b", c="d"};
				var result = structDelete(testStruct, "c", true);
				expect(result).toBeTrue();
			});
			it("returns false if the indicatenotexisting argument is true and the key didn't exist", function(){
				var testStruct = {a="b", c="d"};
				var result = structDelete(testStruct, "e", true);
				expect(result).toBeFalse();
			});
		});

		describe("structFind() tests", function(){
			it("returns the value of the key found in a struct", function(){
				var testStruct = {a="b", c="d"};
				var result = structFind(testStruct, "c");
				expect(result).toBe("d");
			});
			it("returns the value of the key found in a struct", function(){
				var testStruct = {a="b", c="d"};
				var result = structFind(testStruct, "e");
				expect(result).toBeEmpty();
			});
		});

		describe("structFindKey() tests", function(){
			it("returns an empty array for a key that doesn't exist in the struct", function(){
				var testStruct = {a="b", c="d"};
				var result = structFindKey(testStruct, "e");
				expect(result).toBeArray();
				expect(result).toHaveLength(0);
			});
			it("returns an array with a match of a key that exists in the struct", function(){
				var testStruct = {a="b", c="d"};
				var result = structFindKey(testStruct, "c");
				expect(result).toBeArray();
				expect(result).toHaveLength(1);
			});
			it("returns an array with a single match of a key that exists in the struct multiple times", function(){
				var testStruct = {a="b", c="d", e={c="f"}};
				var result = structFindKey(testStruct, "c");
				expect(result).toBeArray();
				expect(result).toHaveLength(1);
			});
			it("returns an array with a multiple matches of a key that exists in the struct multiple times, when the scope is ALL", function(){
				var testStruct = {a="b", c="d", e={c="f"}};
				var result = structFindKey(testStruct, "c", "ALL");
				expect(result).toBeArray();
				expect(result).toHaveLength(2);
			});
		});

		describe("structFindValue() tests", function(){
			it("returns an empty array for a value that doesn't exist in the struct", function(){
				var testStruct = {a="b", c="d"};
				var result = structFindValue(testStruct, "e");
				expect(result).toBeArray();
				expect(result).toHaveLength(0);
			});
			it("returns an array with a match of a value that exists in the struct", function(){
				var testStruct = {a="b", c="d"};
				var result = structFindValue(testStruct, "d");
				expect(result).toBeArray();
				expect(result).toHaveLength(1);
			});
			it("returns an array with a single match of a value that exists in the struct multiple times", function(){
				var testStruct = {a="b", c="d", e={f="d"}};
				var result = structFindValue(testStruct, "d");
				expect(result).toBeArray();
				expect(result).toHaveLength(1);
			});
			it("returns an array with a multiple matches of a value that exists in the struct multiple times, when the scope is ALL", function(){
				var testStruct = {a="b", c="d", e={f="d"}};
				var result = structFindValue(testStruct, "d", "all");
				expect(result).toBeArray();
				expect(result).toHaveLength(2);
			});
		});

		describe("structGet() tests", function(){
			it("creates the substruct path specified when it doesn't exist in an empty struct", function(){
				var testStruct = {};
				var result = structGet("testStruct.a.b.c");
				expect(result).toBeStruct();
				expect(result).toBe({});
				expect(testStruct).toBe({a={b={c={}}}});
			});
			it("creates the substruct path specified when it doesn't exist in an empty struct (includes array references)", function(){
				var testStruct = {};
				var result = structGet("testStruct.a[1].b[2].c[3]");
				expect(result).toBeStruct();
				expect(result).toBe({});

				var expected = {a=[{b=[]}]};
				expected.a[1].b[2]={c=[]};
				expected.a[1].b[2].c[3] = {};
				expect(testStruct).toBe(expected);
			});
			it("completes the substruct path specified when it doesn't exist in a struct", function(){
				var testStruct = {a={}};
				var result = structGet("testStruct.a.b.c");
				expect(result).toBeStruct();
				expect(result).toBe({c={}});
				expect(testStruct).toBe({a={b={c={}}}});
			});
			it("returns a substruct if it is found in the struct", function(){
				var testStruct = {a={b={c={}}}};
				var result = structGet("testStruct.a.b");
				expect(result).toBeStruct();
				expect(result).toBe({c={}});
				expect(testStruct).toBe({a={b={c={}}}});
			});
			it("destroys existing subkeys if they are not themselves structs", function(){
				var testStruct = {a={b={c={d="NOT A STRUCT"}}}};
				var result = structGet("testStruct.a.b.c.d.e");
				expect(result).toBeStruct();
				expect(result).toBe({});
				expect(testStruct).toBe({a={b={c={d={e={}}}}}});
			});
		});

		describe("structInsert() tests", function(){
			it("new key is inserted into empty struct", function(){
				var testStruct = {};
				structInsert(testStruct, "a", "b");
				expect(testStruct).toBe({a="b"});
			});
			it("throws an exception if the key already exists", function(){
				expect(function(){
					var testStruct = {a="b"};
					structInsert(testStruct, "a", "c");
				}).toThrow("expression");
			});
			it("overwrites existing key in struct when allowoverwrite is true", function(){
				var testStruct = {a="b"};
				structInsert(testStruct, "a", "c", true);
				expect(testStruct).toBe({a="c"});
			});
		});

		describe("structIsEmpty() tests", function(){
			it("is true for an empty struct", function(){
				var testStruct = {};
				var result = structIsEmpty(testStruct);
				expect(result).toBeTrue();
			});
			it("is false for an empty struct", function(){
				var testStruct = {a="b"};
				var result = structIsEmpty(testStruct);
				expect(result).toBeFalse();
			});
		});

		describe("structKeyArray() tests", function(){
			it("returns an array of its keys", function(){
				var testStruct = {a="b", c="d", e="f"};
				var result = structKeyArray(testStruct);
				arraySort(result, "TEXTNOCASE");
				expect(result).toBe(["a","c","e"]);
			});
		});

		describe("structKeyList() tests", function(){
			it("returns a list of its keys", function(){
				var testStruct = {a="b", c="d", e="f"};
				var result = structKeyList(testStruct);
				result = listSort(result, "TEXTNOCASE");
				expect(result).toBe("a,c,e");
			});
		});

		describe("structNew() tests", function(){
			it("has not been implemented", function(){
				var result = structNew();
				expect(result).toBe({});
			});
		});

		describe("structSort() tests", function(){
			it("returns an array of keys sorted by string value", function(){
				var testStruct = {a="z", b="y", c="x"};
				var result = structSort(testStruct, "TEXTNOCASE");
				expect(result).toBe(["c","b","a"]);
			});
			it("returns an array of keys reverse-sorted by string value", function(){
				var testStruct = {a="x", b="y", c="z"};
				var result = structSort(testStruct, "TEXTNOCASE","DESC");
				expect(result).toBe(["c","b","a"]);
			});
			it("returns an array of keys sorted by subkey value", function(){
				var testStruct = {a={sortKey="z"}, b={sortKey="y"}, c={sortKey="x"}};
				var result = structSort(testStruct, "TEXTNOCASE","ASC", "sortKey");
				expect(result).toBe(["c","b","a"]);
			});
			if (!structKeyExists(server, "Railo")){
				include "structSortWithEncoding.cfm";
			}
		});

		describe("structUpdate() tests", function(){
			it("new key is inserted into empty struct", function(){
				expect(function(){
				var testStruct = {};
				structUpdate(testStruct, "a", "b");
				}).toThrow("expression");
			});
			it("overwrites existing key in struct", function(){
				var testStruct = {a="b"};
				structUpdate(testStruct, "a", "c");
				expect(testStruct).toBe({a="c"});
			});
		});

		describe("structEach() tests", function(){
			it("processes each key & value", function(){
				var testStruct = {a="b",c="d"};
				var result = "";
				structEach(testStruct, function(k,v){
					result = listAppend(result, "#k#:#v#");
				});
				expect(result).toBe("a:b,c:d");
			});
		});

		describe("structFilter() tests", function(){
			it("filters each key/value pair as per callback", function(){
				var testStruct = {a="b",c="d",e="f",g="h"};
				var result = structFilter(testStruct, function(k,v){
					return k == "a" || v == "h";
				});
				expect(result).toBe({a="b",g="h"});
			});
		});

		describe("structKeyTranslate() tests", function(){
			it("translates a dotted key name into a deep struct", function(){
				var testStruct = {"a.b.c" = "d"};
				structKeyTranslate(testStruct);
				expect(testStruct).toBe({a={b={c="d"}}});
			});
			it("does not translate a dotted key name when it is beyond the first level", function(){
				var testStruct = {"a.b.c"="d",e={"f.g"="h"}};
				structKeyTranslate(testStruct, false);
				expect(testStruct).toBe({a={b={c="d"}},e={"f.g"="h"}});
			});
			it("translates a dotted key name into a deep struct, preserving the original key as well", function(){
				var testStruct = {"a.b.c" = "d"};
				structKeyTranslate(testStruct, true, true);
				expect(testStruct).toBe({"a.b.c"="d", a={b={c="d"}}});
			});
		});

	}
}