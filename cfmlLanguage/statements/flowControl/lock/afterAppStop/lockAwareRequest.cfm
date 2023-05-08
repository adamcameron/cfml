<cfset logMessage("START " & CGI.script_name.listLast("/"))>
<cflock name="LOCK_APP" type="exclusive" timeout="1" throwontimeout="true">
</cflock>
<cfset logMessage("END " & CGI.script_name.listLast("/"))>
