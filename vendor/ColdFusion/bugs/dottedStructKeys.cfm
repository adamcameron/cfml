<cfscript>
key1 = "prefix.key1";
key2 = "prefix.key2";

st = {};
"st.#key1#" = "set via quoted variable name";
st[key2] = "set via associative array notation";
writeDump(st);

writeDump(var=[
	{key1=isDefined("st.prefix.key1")},
	{key2=isDefined("st.prefix.key2")}
], label="isDefined()");
writeDump(var=[
	{prefix=structKeyExists(st, "prefix")},
	{"prefix.key1"=structKeyExists(st, "prefix") && structKeyExists(st.prefix, "key1")},
	{key1=structKeyExists(st, "prefix.key1")},
	{key2=structKeyExists(st, "prefix.key2")}
], label="structKeyExists()");

safe(function(){
	writeOutput("st.prefix.key1: #st.prefix.key1#<br>");
});

safe(function(){
	writeOutput("st.prefix.key2: #st.prefix.key2#<br>");
});

safe(function(){
	writeOutput("st['prefix.key2']: #st['prefix.key2']#<br>");
});

function safe(f){
	try {
		f();
	}catch (any e){
		writeOutput("#e.type# #e.message# #e.detail#<br>");	
	}
}
</cfscript>