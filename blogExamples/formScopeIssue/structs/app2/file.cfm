<cfoutput><h2>Top of #getFileFromPath(getCurrentTemplatePath())#</h2></cfoutput>
<cfset session.mySimpleValue++>
<cfset session.myStruct = {
	mySimpleValue = session.mySimpleValue
}>
<cfdump var="#session#">
<cfoutput><h2>Bottom of #getFileFromPath(getCurrentTemplatePath())#</h2></cfoutput>