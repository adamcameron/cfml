<cfscript>
key1 = "prefix.key1";
key2 = "prefix.key2";
key3 = "prefix.key3";

st = {};
"st.#key1#" = "set via quoted variable name";
st["#key2#"] = "set via quoted associative array notation";
st[key3] = "set via unquoted associative array notation";
writeDump(st);
/*
writeDump(var=[
	{key1=st.prefix.key1},
	{key2=st.prefix.key2},
	{key3=st.prefix.key3}
], label="values");
*/
writeDump(var=[
	{key1=isDefined("st.prefix.key1")},
	{key2=isDefined("st.prefix.key2")},
	{key3=isDefined("st.prefix.key3")}
], label="isDefined()");
writeDump(var=[
	{prefix=structKeyExists(st, "prefix")},
	{"prefix.key1"=structKeyExists(st, "prefix") && structKeyExists(st.prefix, "key1")},
	{key1=structKeyExists(st, "prefix.key1")},
	{key2=structKeyExists(st, "prefix.key3")},
	{key3=structKeyExists(st, "prefix.key3")}
], label="structKeyExists()");
</cfscript>