<cffunction name="getNetworkIdentity" returntype="string" output="false" hint="Returns an identity for the server based on its network address(es).">
	<cfscript>
		var oNet		= createObject("java","java.net.NetworkInterface");
		var eInterfaces	= oNet.getNetworkInterfaces();
		var oInterface	= false;
		var eAddresses	= false;
		var oAddress	= false;
		var sAddress	= "";
		var lAddresses	= "";

		while (eInterfaces.hasMoreElements()){
			oInterface = eInterfaces.nextElement();
			eAddresses = oInterface.getInetAddresses();
			while (eAddresses.hasMoreElements()){
				oAddress = eAddresses.nextElement();
				sAddress = oAddress.getHostAddress();

				lAddresses = listAppend(lAddresses, sAddress);
			}
		}
		return hash(lAddresses);
	</cfscript>
</cffunction>

<cfdump var="#getIdentity()#">
