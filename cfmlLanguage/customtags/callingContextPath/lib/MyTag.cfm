<cfset callStack = callStackGet()>
<cfset callingFile = callStack[2].template>
<cfset callingDir = getDirectoryFromPath(callingFile)>
<cfset includeRoot = expandPath("/")>
<cfset includePath = callingDir.replace(includeRoot, "/")>

<cfdump var="#[callingFile,includeRoot,includePath]#">
