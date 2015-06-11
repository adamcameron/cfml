<cfapplication name="requestsessiontest" sessionmanagement="yes">

<cfparam name="session.foo" default="#structNew()#">
<cfdump var="#session.foo#" label="Before request.bar assignment"><br />

<cfset request.bar = session.foo>
<cfset request.bar[createuuid()] = now()>

<cfdump var="#session.foo#" label="After request.bar assignment">