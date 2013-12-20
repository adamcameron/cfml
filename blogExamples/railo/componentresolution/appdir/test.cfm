<cfscript>
// test.cfm
proxy = new differentpackage.proxy("LocalComponent");

localComponent = proxy.getProxiedObject();

writeDump(var=variables);
</cfscript>