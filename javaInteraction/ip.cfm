<cfset IPAddresses = "">
<cfset net = createObject('java','java.net.NetworkInterface')>
<cfset interfaces = net.getNetworkInterfaces()>
<cfloop condition="#interfaces.hasMoreElements()#">
	<cfset interface = interfaces.nextElement()>
	<cfset addresses = interface.getInetAddresses()>
	<cfloop condition="#addresses.HasMoreElements()#">
		<cfset address = addresses.nextElement()>
		<cfset IPAddresses = listAppend(IPAddresses, replace(address.toString(), "/", "", "ALL"))>
	</cfloop>
</cfloop>
<cfoutput>#replace(IPAddresses, ",", "<br />", "ALL")#</cfoutput>