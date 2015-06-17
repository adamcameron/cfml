<cfset oAdministrator = new CFIDE.adminapi.administrator()>
<cfset a = oAdministrator.getUpdateCount()>
<cfdump var="#a#">