<!--- customLog.cfm --->
<cfset u = createUuid()>
<cfset msg = "Test Log message #u#">
<cflog file="logTesting" text="#msg#">
<cfoutput>#msg#</cfoutput>