<cfapplication name="testIsDefined" sessionmanagement="true">

<cfset session.session.findMe = "two deep">
<cfset session.session.sessionfindMe = "three deep">

<cfoutput>
structKeyExists(session, "findMe"): #structKeyExists(session, "findMe")#<br />
isDefined(session.findMe): <cftry>#isDefined(session.findMe)#<cfcatch>Didn't think that one would work too well [#cfcatch.message#] ;-)</cfcatch></cftry><br />
isDefined("session.findMe"): #isDefined("session.findMe")#<br />
structFindKey(session, "findMe"): <cfdump var='#structFindKey(session, "findMe")#'><br />

</cfoutput>