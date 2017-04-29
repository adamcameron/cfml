component extends="testbox.system.BaseSpec" {
	function run() {
		describe("query higher-order function tests", function(){
			var baseNumbers = queryNew("id,en,mi", "integer,varchar,varchar", [
				[1,"one","tahi"],
				[2,"two","rua"],
				[3,"three","toru"],
				[4,"four","wha"]
			]);
			
			describe("sort tests", function(){
				var numbers = duplicate(baseNumbers);
				var sortedNumbers = numbers.sort(function(n1, n2){
					return n2.id - n1.id;
				});
				it("returns a sorted query", function(){
					var expected = queryNew("id,en,mi", "integer,varchar,varchar", [
						[4,"four","wha"],
						[3,"three","toru"],
						[2,"two","rua"],
						[1,"one","tahi"]
					]);

					expect(sortedNumbers).toBe(expected);
				});
				it("leaves the source data alone", function(){
					expect(numbers).toBe(baseNumbers);
				});
			});
			
			describe("map tests", function(){
				var numbers = duplicate(baseNumbers);
				var remapTemplate = queryNew("value,english,maori"); 

				var reMapped = numbers.map(function(row){
					return {value=row.id, english=row.en, maori=row.mi};
				}, remapTemplate);

				it("does a basic remapping", function(){
					var queryWithDifferentColumns = queryNew("value,english,maori", "integer,varchar,varchar", [
						[1,"one","tahi"],
						[2,"two","rua"],
						[3,"three","toru"],
						[4,"four","wha"]
					]);

					expect(reMapped).toBe(queryWithDifferentColumns);
				});
				it("does not mess with the remapTemplate", function(){
					expect(remapTemplate).toBe(queryNew("value,english,maori"));
				});
			});
			
			describe("reduce tests", function(){
				var numbers = duplicate(baseNumbers);
				
				it ("accepts a default for the first argument", function(){
					var ids = numbers.reduce(function(sum=[], row){
						return sum.append(row.id);
					});

					expect(ids).toBe([1,2,3,4]);
				});
				it ("accepts an initial value", function(){
					var ids = numbers.reduce(function(sum, row){
						return sum.append(row.id);
					}, []);

					expect(ids).toBe([1,2,3,4]);
				});
			});
			
		});
		
		describe("hash test", function(){
			it("is implemented as a method of strings", function(){
				var s = "test_string";

				expect(s.hash()).toBe(hash(s));
			});
		});

		describe("duplicate test", function(){

		it("is implemented as a method of structs", function(){
				var st1 = {value="initial"};
				var st2 = st1.duplicate();
				st2.value = "updated";

				expect(st1.value).toBe("initial");
				expect(st2.value).toBe("updated");
			});
			it("is implemented as a method of arrays", function(){
				var v = {value="initial"};
				var a1 = [v];
				var a2 = a1.duplicate();

				a2[1].value = "updated";
				expect(v.value).toBe("initial");
				expect(a1[1].value).toBe("initial");
				expect(a2[1].value).toBe("updated");
			});
			it("is implemented as a method of queries", function(){
				var q1 = queryNew("value", "varchar", ["initial"]);
				var q2 = q1.duplicate();

				q2.value[1] = "updated";
				expect(q1.value[1]).toBe("initial");
				expect(q2.value[1]).toBe("updated");
			});
			it("is implemented as a method of strings", function(){
				var s1 = "initial";
				var s2 = s1.duplicate();

				s2 = "updated";
				expect(s1).toBe("initial");
				expect(s2).toBe("updated");
			});
			it("is implemented as a method of doubles", function(){
				var d1 = 17 * 19;
				var d2 = d1.duplicate();
				d2 = 23 * 29;

				expect(d1).toBe(17*19);
				expect(d2).toBe(23*29);
			});
			it("is implemented as a method of dates", function(){
				var ts1 = now();
				var ts2 = ts1.duplicate();
				var ts3 = ts2.add("yyyy", 1);

				expect(ts1.year()).toBe(now().year());
				expect(ts2.year()).toBe(now().year());
				expect(ts3.year()).toBe(now().year()+1);
			});
			it("is implemented as a method of booleans", function(){
				var b1 = !!true;
				var b2 = b1.duplicate();
				b2 = !true;

				expect(b1).toBeTrue();
				expect(b2).toBeFalse();
			});
			it("is implemented as a method of XML", function(){
				var x1 = xmlParse("<value>initial</value>");
				var x2 = x1.duplicate();
				x2["value"][1]["xmlText"] = "updated";

				expect(x1["value"][1]["xmlText"]).toBe("initial");
				expect(x2["value"][1]["xmlText"]).toBe("updated");
			});
		});
	}
}