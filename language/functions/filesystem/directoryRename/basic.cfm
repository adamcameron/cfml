<cfset sBaseDir = "ram:///directoryRename/">
<cfset directoryRename(sBaseDir & "renameMe", sBaseDir & "putInHere/Moved/")>

<cfset q = directoryList("ram:///", true, "query")>
<cfdump var="#q#">
