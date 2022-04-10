<cfscript>

initialStruct = {};
initialStruct.append({});
writeDump([initialStruct,{}]);

initialStruct = {};
structWithNewKey = {a="b"};
initialStruct.append(structWithNewKey);
writeDump([initialStruct,structWithNewKey]);

initialStruct = {a="b"};
structWithNewKey = {c="d"};
initialStruct.append(structWithNewKey);
writeDump([initialStruct,{a="b",c="d"}]);

initialStruct = {a="be"};
structWithNewKey = {a="bee"};
initialStruct.append(structWithNewKey);
writeDump([initialStruct,{a="bee"}]);

initialStruct = {a="be"};
structWithNewKey = {a="bee"};
initialStruct.append(structWithNewKey, false);
writeDump([initialStruct,{a="bee"}]);

initialStruct = {a="b"};
initialStruct.clear();
writeDump([initialStruct,{}]);

initialStruct = CGI;
result = initialStruct.clear();
writeDump([result]);

initialStruct = {a="b"};
newStruct = initialStruct.copy();
writeDump([newStruct,initialStruct]);

initialStruct = {a="b", c={d={e="f"}}};
result = initialStruct.copy();
initialStruct.c.d.e = "g";
writeDump([result,initialStruct]);

testStruct = {a="b", c="d"};
count = testStruct.count();
writeDump([count,2]);

testStruct = {a="b", c="d"};
testStruct.delete("c");
writeDump([testStruct,{a="b"}]);

testStruct = {a="b", c="d"};
result = testStruct.delete("c");
writeDump([result]);

result = testStruct.delete("d");
writeDump([result]);

testStruct = {a="b", c="d"};
result = testStruct.delete("c", true);
writeDump([result]);

testStruct = {a="b", c="d"};
result = testStruct.delete("e", true);
writeDump([result]);

testStruct = {a="b", c="d"};
result = testStruct.find("c");
writeDump([result,"d"]);

try {
	testStruct = {a="b", c="d"};
	result = testStruct.find("e");
	writeDump([result]);
} catch (any e){
	writeDump([e.type,e.message,e.detail]);
}

testStruct = {a="b", c="d"};
result = testStruct.findKey("e");
writeDump([result,0]);

testStruct = {a="b", c="d"};
result = testStruct.findKey("c");
writeDump([result,1]);

testStruct = {a="b", c="d", e={c="f"}};
result = testStruct.findKey("c");
writeDump([result,1]);

testStruct = {a="b", c="d", e={c="f"}};
result = testStruct.findKey("c", "ALL");
writeDump([result,2]);

testStruct = {a="b", c="d"};
result = testStruct.findValue("e");
writeDump([result,0]);

testStruct = {a="b", c="d"};
result = testStruct.findValue("d");
writeDump([result,1]);

testStruct = {a="b", c="d", e={f="d"}};
result = testStruct.findValue("d");
writeDump([result,1]);

testStruct = {a="b", c="d", e={f="d"}};
result = testStruct.findValue("d", "all");
writeDump([result,2]);

testStruct = {};
result = testStruct.get("testStruct.a.b.c");
writeDump([result,{}]);
writeDump([testStruct,{a={b={c={}}}}]);

testStruct = {};
result = testStruct.get("testStruct.a[1].b[2].c[3]");
writeDump([result,{}]);

expected = {a=[{b=[]}]};
expected.a[1].b[2]={c=[]};
expected.a[1].b[2].c[3] = {};
writeDump([testStruct,expected]);

testStruct = {a={}};
result = testStruct.get("testStruct.a.b.c");
writeDump([result,{c={}}]);
writeDump([testStruct,{a={b={c={}}}}]);

testStruct = {a={b={c={}}}};
result = testStruct.get("testStruct.a.b");
writeDump([result]);
writeDump([result,{c={}}]);
writeDump([testStruct,{a={b={c={}}}}]);

testStruct = {a={b={c={d="NOT A STRUCT"}}}};
result = testStruct.get("testStruct.a.b.c.d.e");
writeDump([result,{}]);
writeDump([testStruct,{a={b={c={d={e={}}}}}}]);

testStruct = {};
testStruct.insert("a", "b");
writeDump([testStruct,{a="b"}]);

try {
	testStruct = {a="b"};
	testStruct.insert("a", "c");
} catch (any e){
	writeDump([e.type,e.message,e.detail]);
}

testStruct = {a="b"};
testStruct.insert("a", "c", true);
writeDump([testStruct,{a="c"}]);

testStruct = {};
result = testStruct.isEmpty();
writeDump([result]);

testStruct = {a="b"};
result = testStruct.isEmpty();
writeDump([result]);

testStruct = {a="b", c="d", e="f"};
result = testStruct.keyArray();
result.sort("TEXTNOCASE");
writeDump([result,["a","c","e"]]);

testStruct = {a="b", c="d", e="f"};
result = testStruct.keyList();
result = listSort(result, "TEXTNOCASE");
writeDump([result,"a,c,e"]);

try{
	testStruct = {a="b", c="d", e="f"};
	result = testStruct.new();
} catch (any e){
	writeDump([e.type,e.message,e.detail]);
}


testStruct = {a="z", b="y", c="x"};
result = testStruct.sort("TEXTNOCASE");
writeDump([result,["c","b","a"]]);

testStruct = {a="x", b="y", c="z"};
result = testStruct.sort("TEXTNOCASE","DESC");
writeDump([result,["c","b","a"]]);

testStruct = {a={sortKey="z"}, b={sortKey="y"}, c={sortKey="x"}};
result = testStruct.sort("TEXTNOCASE","ASC", "sortKey");
writeDump([result,["c","b","a"]]);

testStruct = {tt="tta", Eszett="ßa", lc="ssc", rr="rra", uc="SSb"};
result = testStruct.sort("TEXTNOCASE", "ASC", "", true);
writeDump([result,["rr","Eszett","uc","lc","tt"]]);

try {
	testStruct = {};
	testStruct.update("a", "b");
} catch (any e){
	writeDump([e.type,e.message,e.detail]);
}

testStruct = {a="b"};
testStruct.update("a", "c");
writeDump([testStruct,{a="c"}]);

testStruct = {a="b",c="d"};
result = "";
testStruct.each(function(k,v){
	result = listAppend(result, "#k#:#v#");
});
writeDump([result,"a:b,c:d"]);

testStruct = {a="b",c="d",e="f",g="h"};
result = testStruct.filter(function(k,v){
	return k == "a" || v == "h";
});
writeDump([result,{a="b",g="h"}]);

testStruct = {"a.b.c" = "d"};
testStruct.keyTranslate();
writeDump([testStruct,{a={b={c="d"}}}]);

testStruct = {"a.b.c"="d",e={"f.g"="h"}};
testStruct.keyTranslate(false);
writeDump([testStruct,{a={b={c="d"}},e={"f.g"="h"}}]);

testStruct = {"a.b.c" = "d"};
testStruct.keyTranslate(true, true);
writeDump([testStruct,{"a.b.c"="d", a={b={c="d"}}}]);

</cfscript>