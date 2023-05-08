<cfset jsonList = "{name:'col1', index:'col1', sorttype:'string'},{name:'col2', index:'col2', sorttype:'string'},{name:'col3', index:'col3', sorttype:'string'}">
<cfset jsonArray = "[" & jsonList & "]">
<cfset st = deserializeJson(jsonArray)>

<cfdump var="#variables#">