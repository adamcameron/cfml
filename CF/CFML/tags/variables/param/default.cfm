<cfset request.foo = "Initial value">

<cfparam name="request.foo" default="#getFoo()#">
<cfdump var="#request#">

<cffunction name="getFoo">
    getFoo() was called<br />
    <cfset sleep(3000)><!---emulate some processing that takes a while --->
    <cfreturn "Default value">
</cffunction>