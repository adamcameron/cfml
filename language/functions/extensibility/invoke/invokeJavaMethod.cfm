<cfscript>
// invokeJavaMethod.cfm
javaString = createObject("java", "java.lang.String");
javaString.init("tahi, rua, toru, wha");

cfString = invoke(javaString, "toString");
length = invoke(javaString, "length");
indexOf = invoke(javaString, "indexOf", ["toru"]);
writeDump([cfString, length, indexOf]);
</cfscript>