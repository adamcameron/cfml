<cfscript>
function createByteArray(string){
	var objString = createObject("Java", "java.lang.String").init(JavaCast("string", string));
	return objString.getBytes();
}

s1 = "Zachary Cameron Lynch";
ba = createByteArray(s1);
s2 = toString(ba);
c = ba.getClass().getName();
writeDump(variables);
</cfscript>
