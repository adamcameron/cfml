<!--- cfinvokeJavaMethod.cfm --->
<cfobject type="component" action="create" class="java.lang.String" name="javaString">
<cfinvoke component="#javaString#" method="init" argumentcollection="#['tahi, rua, toru, wha']#">
<cfscript>

cfString = invoke(javaString, "toString");
length = invoke(javaString, "length");
indexOf = invoke(javaString, "indexOf", ["toru"]);
writeDump([cfString, length, indexOf]);
</cfscript>