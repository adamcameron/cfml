<cfoutput><h2>Top of #getFileFromPath(getCurrentTemplatePath())#</h2></cfoutput>
<cfset request.session.mySimpleValue = createUuid()>
<cfset request.session.myStruct = {
	mySimpleValue = request.session.mySimpleValue
}>
<cfdump var="#session#">
<cfoutput><h2>Bottom of #getFileFromPath(getCurrentTemplatePath())#</h2></cfoutput>