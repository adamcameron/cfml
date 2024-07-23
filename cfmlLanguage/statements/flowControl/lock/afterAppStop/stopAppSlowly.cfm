<cfset logMessage("START " & CGI.script_name.listLast("/"))>
<cflock name="LOCK_APP" type="exclusive" timeout="30" throwontimeout="true">
	<cfset applicationStop()>
	<cfset logMessage("APP STOPPED " & CGI.script_name.listLast("/"))>
	<cfset sleep(10000)>
</cflock>
<cfset logMessage("END " & CGI.script_name.listLast("/"))>
