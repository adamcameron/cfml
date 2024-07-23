<cfset oExtensions = new CFIDE.adminapi.extensions()>
<cfset st = oExtensions.getRESTServices()>
<cfdump var="#st#">

<cfset st = oExtensions.deleteRESTService("C:\ColdFusionZeus\cfusion\wwwroot\shared\CF10\rest\api\secureapp")>
<cfdump var="#st#">

<cfset st = oExtensions.getRESTServices(true)>
<cfdump var="#st#">