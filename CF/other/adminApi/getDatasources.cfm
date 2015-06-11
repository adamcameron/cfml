<cfset createObject("component", "CFIDE.adminapi.administrator").login("")>
<cfset stDsns = createObject("component", "CFIDE.adminapi.datasource").getDatasources()>
<cfdump var="#stDsns#">