<cfscript>
// struct.find.cfm
st = {a="b",c="d"};
try {
	result = st.find("e");
}
catch (any e){
	writeDump([e.type,e.message,e.detail]);
}
</cfscript>