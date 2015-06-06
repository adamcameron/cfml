<cfscript>
	param name="URL.address" type="string";
	param name="URL.timeout" type="integer" default=5000;
	
	inetAddress = createObject("java", "java.net.InetAddress").getByName(URL.address);
	
	isResponsive = inetAddress.isReachable(URL.timeout);
	
	writeDump(variables);
</cfscript>