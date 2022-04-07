<cfapplication name="testIsDefined" sessionmanagement="true">

<cfset session.foo = "bar">

<cfoutput>#isDefined("foo")#</cfoutput>