<!--- testEcho.cfm --->
<cfset argValue = createUuid()>
<cfoutput>#argValue#</cfoutput>
<hr>

<cfhttp method="get" url="http://localhost:8500/rest/components/echo/oneCorrectArg/#argValue#" result="oneCorrectArg" />
<cfdump var="#oneCorrectArg#">
<hr>

<cfhttp method="get" url="http://localhost:8500/rest/components/echo/noRestArgSource/#argValue#" result="noRestArgSource" />
<cfdump var="#noRestArgSource#">
<hr>

<cfhttp method="get" url="http://localhost:8500/rest/components/echo/mismatch/#argValue#" result="mismatch" />
<cfdump var="#mismatch#">