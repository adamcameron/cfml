<cfapplication name="testIsDefined" sessionmanagement="true">

<cfset session.session.session.crap = 1>
<cfoutput>
structKeyExists(session, "crap"): #structKeyExists(session, "crap")#<br />
isDefined(session.crap): <cftry>#isDefined(session.crap)#<cfcatch>Didn't think that one would work too well [#cfcatch.message#] ;-)</cfcatch></cftry><br />
isDefined("session.crap"): #isDefined("session.crap")#<br />
</cfoutput>