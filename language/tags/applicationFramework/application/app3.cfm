<cfset variables.transfer = structNew()>

<cfapplication name="app1" sessionmanagement="true">
<cfset structAppend(variables.transfer, session)>

<cfapplication name="app2" sessionmanagement="true">
<cfset structAppend(variables.transfer, session)>

<cfapplication name="app3" sessionmanagement="true">

<cfset session.app3 = "app3">

<cfset session.transfer = variables.transfer>

<cfdump var="#session#">