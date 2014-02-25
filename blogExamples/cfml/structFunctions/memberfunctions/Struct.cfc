// Struct.cfc
component {
	
	pageEncoding "utf-8"; // there's a ß, further down

	function run(){
		describe("append() tests", function(){
			it("appends two empty structs", function(){
				var initialStruct = {};
				initialStruct.append({});
				expect(initialStruct).toBe({});
			});
			it("appends a new key to an empty struct", function(){
				var initialStruct = {};
				var structWithNewKey = {a="b"};
				initialStruct.append(structWithNewKey);
				expect(initialStruct).toBe(structWithNewKey);
			});
			it("appends a new key to a struct with an existing key", function(){
				var initialStruct = {a="b"};
				var structWithNewKey = {c="d"};
				initialStruct.append(structWithNewKey);
				expect(initialStruct).toBe({a="b",c="d"});
			});
			it("by default overwrites a key's value in a struct with a new value from the appended struct", function(){
				var initialStruct = {a="be"};
				var structWithNewKey = {a="bee"};
				initialStruct.append(structWithNewKey);
				expect(initialStruct).toBe({a="bee"});
			});
			it("will not overwrite a key's value in a struct with a new value from the appended struct if the overwriteFlag is set to false", function(){
				var initialStruct = {a="be"};
				var structWithNewKey = {a="bee"};
				initialStruct.append(structWithNewKey, false);
				expect(initialStruct).toBe({a="be"});
			});
		});

		describe("clear() tests", function(){
			it("clears a struct", function(){
				var initialStruct = {a="b"};
				initialStruct.clear();
				expect(initialStruct).toBe({});
			});
			it("returns false if the struct was not cleared", function(){
				var initialStruct = CGI;
				var result = initialStruct.clear();
				expect(result).toBeTrue();
			});
		});

		describe("copy() tests", function(){
			it("copies a struct", function(){
				var initialStruct = {a="b"};
				var newStruct = initialStruct.copy();
				expect(newStruct).toBe(initialStruct);
			});
			it("copies deep structs by reference", function(){
				var initialStruct = {a="b", c={d={e="f"}}};
				var result = initialStruct.copy();

				initialStruct.c.d.e = "g";
				expect(result).toBe(initialStruct);
			});
		});

		describe("count() tests", function(){
			it("counts keys in a struct", function(){
				var testStruct = {a="b", c="d"};
				var count = testStruct.count();
				expect(count).toBe(2);
			});
		});

		describe("delete() tests", function(){
			it("deletes a key from a struct", function(){
				var testStruct = {a="b", c="d"};
				testStruct.delete("c");
				expect(testStruct).toBe({a="b"});
			});
			it("returns true if the indicatenotexisting argument is default", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.delete("c");
				expect(result).toBeTrue();

				result = testStruct.delete("d");
				expect(result).toBeTrue();
			});
			it("returns true if the indicatenotexisting argument is true and the key existed", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.delete("c", true);
				expect(result).toBeTrue();
			});
			it("returns false if the indicatenotexisting argument is true and the key didn't exist", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.delete("e", true);
				expect(result).toBeFalse();
			});
		});

		describe("find() tests", function(){
			it("returns the value of the key found in a struct", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.find("c");
				expect(result).toBe("d");
			});
			it("returns the value of the key found in a struct", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.find("e");
				expect(result).toBeEmpty();
			});
		});

		describe("findKey() tests", function(){
			it("returns an empty array for a key that doesn't exist in the struct", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.findKey("e");
				expect(result).toBeArray();
				expect(result).toHaveLength(0);
			});
			it("returns an array with a match of a key that exists in the struct", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.findKey("c");
				expect(result).toBeArray();
				expect(result).toHaveLength(1);
			});
			it("returns an array with a single match of a key that exists in the struct multiple times", function(){
				var testStruct = {a="b", c="d", e={c="f"}};
				var result = testStruct.findKey("c");
				expect(result).toBeArray();
				expect(result).toHaveLength(1);
			});
			it("returns an array with a multiple matches of a key that exists in the struct multiple times, when the scope is ALL", function(){
				var testStruct = {a="b", c="d", e={c="f"}};
				var result = testStruct.findKey("c", "ALL");
				expect(result).toBeArray();
				expect(result).toHaveLength(2);
			});
		});

		describe("findValue() tests", function(){
			it("returns an empty array for a value that doesn't exist in the struct", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.findValue("e");
				expect(result).toBeArray();
				expect(result).toHaveLength(0);
			});
			it("returns an array with a match of a value that exists in the struct", function(){
				var testStruct = {a="b", c="d"};
				var result = testStruct.findValue("d");
				expect(result).toBeArray();
				expect(result).toHaveLength(1);
			});
			it("returns an array with a single match of a value that exists in the struct multiple times", function(){
				var testStruct = {a="b", c="d", e={f="d"}};
				var result = testStruct.findValue("d");
				expect(result).toBeArray();
				expect(result).toHaveLength(1);
			});
			it("returns an array with a multiple matches of a value that exists in the struct multiple times, when the scope is ALL", function(){
				var testStruct = {a="b", c="d", e={f="d"}};
				var result = testStruct.findValue("d", "all");
				expect(result).toBeArray();
				expect(result).toHaveLength(2);
			});
		});

		describe("get() tests", function(){
			it("creates the substruct path specified when it doesn't exist in an empty struct", function(){
				var testStruct = {};
				var result = testStruct.get("testStruct.a.b.c");
				expect(result).toBeStruct();
				expect(result).toBe({});
				expect(testStruct).toBe({a={b={c={}}}});
			});
			it("creates the substruct path specified when it doesn't exist in an empty struct (includes array references)", function(){
				var testStruct = {};
				var result = testStruct.get("testStruct.a[1].b[2].c[3]");
				expect(result).toBeStruct();
				expect(result).toBe({});

				var expected = {a=[{b=[]}]};
				expected.a[1].b[2]={c=[]};
				expected.a[1].b[2].c[3] = {};
				expect(testStruct).toBe(expected);
			});
			it("completes the substruct path specified when it doesn't exist in a struct", function(){
				var testStruct = {a={}};
				var result = testStruct.get("testStruct.a.b.c");
				expect(result).toBeStruct();
				expect(result).toBe({c={}});
				expect(testStruct).toBe({a={b={c={}}}});
			});
			it("returns a substruct if it is found in the struct", function(){
				var testStruct = {a={b={c={}}}};
				var result = testStruct.get("testStruct.a.b");
				expect(result).toBeStruct();
				expect(result).toBe({c={}});
				expect(testStruct).toBe({a={b={c={}}}});
			});
			it("destroys existing subkeys if they are not themselves structs", function(){
				var testStruct = {a={b={c={d="NOT A STRUCT"}}}};
				var result = testStruct.get("testStruct.a.b.c.d.e");
				expect(result).toBeStruct();
				expect(result).toBe({});
				expect(testStruct).toBe({a={b={c={d={e={}}}}}});
			});
		});

		describe("insert() tests", function(){
			it("new key is inserted into empty struct", function(){
				var testStruct = {};
				testStruct.insert("a", "b");
				expect(testStruct).toBe({a="b"});
			});
			it("throws an exception if the key already exists", function(){
				expect(function(){
					var testStruct = {a="b"};
					testStruct.insert("a", "c");
				}).toThrow("expression");
			});
			it("overwrites existing key in struct when allowoverwrite is true", function(){
				var testStruct = {a="b"};
				testStruct.insert("a", "c", true);
				expect(testStruct).toBe({a="c"});
			});
		});

		describe("isEmpty() tests", function(){
			it("is true for an empty struct", function(){
				var testStruct = {};
				var result = testStruct.isEmpty();
				expect(result).toBeTrue();
			});
			it("is false for an empty struct", function(){
				var testStruct = {a="b"};
				var result = testStruct.isEmpty();
				expect(result).toBeFalse();
			});
		});

		describe("keyArray() tests", function(){
			it("returns an array of its keys", function(){
				var testStruct = {a="b", c="d", e="f"};
				var result = testStruct.keyArray();
				result.sort("TEXTNOCASE");
				expect(result).toBe(["a","c","e"]);
			});
		});

		describe("keyList() tests", function(){
			it("returns a list of its keys", function(){
				var testStruct = {a="b", c="d", e="f"};
				var result = testStruct.keyList();
				result = listSort(result, "TEXTNOCASE");
				expect(result).toBe("a,c,e");
			});
		});

		describe("new() tests", function(){
			it("has not been implemented", function(){
				expect(function(){
					var testStruct = {a="b", c="d", e="f"};
					var result = testStruct.new();
				}).toThrow("expression");
			});
		});

		describe("sort() tests", function(){
			it("returns an array of keys sorted by string value", function(){
				var testStruct = {a="z", b="y", c="x"};
				var result = testStruct.sort("TEXTNOCASE");
				expect(result).toBe(["c","b","a"]);
			});
			it("returns an array of keys reverse-sorted by string value", function(){
				var testStruct = {a="x", b="y", c="z"};
				var result = testStruct.sort("TEXTNOCASE","DESC");
				expect(result).toBe(["c","b","a"]);
			});
			it("returns an array of keys sorted by subkey value", function(){
				var testStruct = {a={sortKey="z"}, b={sortKey="y"}, c={sortKey="x"}};
				var result = testStruct.sort("TEXTNOCASE","ASC", "sortKey");
				expect(result).toBe(["c","b","a"]);
			});
			if (!structKeyExists(server, "Railo")){
				include "structSortWithEncoding.cfm";
			}
		});

		describe("update() tests", function(){
			it("new key is inserted into empty struct", function(){
				expect(function(){
				var testStruct = {};
				testStruct.update("a", "b");
				}).toThrow("expression");
			});
			it("overwrites existing key in struct", function(){
				var testStruct = {a="b"};
				testStruct.update("a", "c");
				expect(testStruct).toBe({a="c"});
			});
		});

		describe("each() tests", function(){
			it("processes each key & value", function(){
				var testStruct = {a="b",c="d"};
				var result = "";
				testStruct.each(function(k,v){
					result = listAppend(result, "#k#:#v#");
				});
				expect(result).toBe("a:b,c:d");
			});
		});

		describe("filter() tests", function(){
			it("filters each key/value pair as per callback", function(){
				var testStruct = {a="b",c="d",e="f",g="h"};
				var result = testStruct.filter(function(k,v){
					return k == "a" || v == "h";
				});
				expect(result).toBe({a="b",g="h"});
			});
		});

		describe("keyTranslate() tests", function(){
			it("translates a dotted key name into a deep struct", function(){
				var testStruct = {"a.b.c" = "d"};
				testStruct.keyTranslate();
				expect(testStruct).toBe({a={b={c="d"}}});
			});
			it("does not translate a dotted key name when it is beyond the first level", function(){
				var testStruct = {"a.b.c"="d",e={"f.g"="h"}};
				testStruct.keyTranslate(false);
				expect(testStruct).toBe({a={b={c="d"}},e={"f.g"="h"}});
			});
			it("translates a dotted key name into a deep struct, preserving the original key as well", function(){
				var testStruct = {"a.b.c" = "d"};
				testStruct.keyTranslate(true, true);
				expect(testStruct).toBe({"a.b.c"="d", a={b={c="d"}}});
			});
		});

	}
}