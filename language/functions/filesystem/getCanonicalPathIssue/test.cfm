<cfoutput>
<cfset relativeFilePath = "../getCanonicalPathIssue/targetfile.cfm">
Relative file path: [#relativeFilePath#]<br>
Does relative path exist: [#fileExists(relativeFilePath)#]<br>
<br>

<cfset expandedPath = expandPath(relativeFilePath)>
Expanded file path: [#expandedPath#]<br>
Does expanded path exist: [#fileExists(expandedPath)#]<br>
<br>

<cfset canonicalPathFromRelativeFilePath = getCanonicalPath(relativeFilePath)>
Canonical path: [#canonicalPathFromRelativeFilePath#]<br>
Does canonical path exist: [#fileExists(canonicalPathFromRelativeFilePath)#]<br>
<br>

<cfset canonicalPathFromExpandedPath = getCanonicalPath(expandedPath)>
Canonical path: [#canonicalPathFromExpandedPath#]<br>
Does canonical path exist: [#fileExists(canonicalPathFromExpandedPath)#]<br>
<br>

<cfset directory = getDirectoryFromPath(canonicalPathFromRelativeFilePath)>
Directory: #directory#<br>
Directory contents and do they exist:<br>
#directoryList(directory).reduce((buffer="", filePath) => buffer & "#filePath#: #fileExists(filePath)#<br>")#
</cfoutput>
