<cfset l = application.oApiDebugging.getIpList()>
<cfdump var="#l#">
<cfset l = application.oApiDebugging.setIp("#l#,192.168.0.101")>