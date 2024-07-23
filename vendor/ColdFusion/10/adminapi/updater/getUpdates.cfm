<cfset oAdministrator = new CFIDE.adminapi.administrator()>
<cfset a = oAdministrator.getUpdates()>
<cfdump var="#a#">
<cfset a = oAdministrator.getUpdates(true)>
<cfdump var="#a#">