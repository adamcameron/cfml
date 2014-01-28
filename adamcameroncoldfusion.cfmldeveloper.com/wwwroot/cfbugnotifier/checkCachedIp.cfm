<cfscript>
// checkCachedIp.cfm
javaLoader = createObject("javaloader.JavaLoader").init();
inetAddress = javaLoader.create("java.net.InetAddress");
writeOutput(inetAddress.getByName("bugbase.adobe.com"));
</cfscript>