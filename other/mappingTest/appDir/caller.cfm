Caller.cfm<br />

<cfset sSiteDir = listGetAt(cgi.script_name, listLen(cgi.script_name, "/") - 2, "/")>
<cfset sAppInclude = "../#sSiteDir#/Application.cfm">
<cfset sAppFile = expandPath(sAppInclude)>

<cfif fileExists(sAppFile)>
	<cfinclude template="#sAppInclude#">
</cfif>