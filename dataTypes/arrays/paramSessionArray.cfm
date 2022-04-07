<cfapplication name="test" sessionmanagement="true">

<cfset session.a = true>
<cfparam name="session.a" default="#arrayNew(1)#" type="array">

<cfdump var="#session#">