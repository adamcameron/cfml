<cfset oExtensions = new CFIDE.adminapi.extensions()>
<cfset st = oExtensions.getRESTServices(true)>
<cfdump var="#st#">

<cfset oExtensions.registerRESTService("C:\ColdFusionZeus\cfusion\wwwroot\shared\CF10\rest\api\secureapp")>
<cfset oExtensions.registerRESTService("C:\ColdFusionZeus\cfusion\wwwroot\shared\CF10\rest\api\testapp")>

<cfset st = oExtensions.getRESTServices(true)>
<cfdump var="#st#">