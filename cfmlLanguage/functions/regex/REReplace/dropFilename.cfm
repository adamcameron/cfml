<cfset sFilePath = REReplace("/www/info/net/projects/blah/foo/index.cfm", "/.*$", "", "ONE")>
<cfdump var="#sFilePath#">