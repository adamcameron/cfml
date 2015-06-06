<cfflush interval="100">
<cftry>
    Straight dump:<br />
    <cfdump var="#application#" expand="false">
    <cfcatch>Blocked</cfcatch>
</cftry>
<hr />
<cftry>
    variable copy dump:<br />
    <cfset a = application>
    <cfdump var="#a#" expand="false">
    <cfcatch>Blocked</cfcatch>
</cftry>
<hr />
<cftry>
    variable structcopy dump:<br />
    <cfset a = structCopy(application)>
    <cfdump var="#a#" expand="false">
    <cfcatch>Blocked</cfcatch>
</cftry>
<hr />
<cftry>
    variable duplicate dump:<br />
    <cfset a = duplicate(application)>
    <cfdump var="#a#" expand="false">
    <cfcatch>Blocked</cfcatch>
</cftry>
<hr />
<cftry>
    Loop:<br />
    <cfloop item="a" collection="#application#">
        <cfoutput>[#a#]:</cfoutput>
        <cfdump var="#application[a]#" expand="false">
    </cfloop>
    <cfcatch>Blocked</cfcatch>
</cftry>
<hr />