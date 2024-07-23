<cfset iIncStart = getTickCount()>
<cfinclude template="i.cfm">
<cfoutput>Total include execution time: #getTickCount() - iIncStart#<br /></cfoutput>
