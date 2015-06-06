<cfset oExtensions = new CFIDE.adminapi.extensions()>
<cfset st = oExtensions.getRESTServices(true)>
<cfdump var="#st#">
<cfloop item="path" collection="#st#">
	<cfset oExtensions.deleteRESTService(path)>
</cfloop>

<cfset st = oExtensions.getRESTServices(true)>
<cfdump var="#st#">