<cfapplication name="isDefined" sessionmanagement="true">

<cfset variables.session.foo = "yah">

<cfif isDefined("session.foo")>
	<cfset x = session.foo>
<cfelse>
	Not set
</cfif>