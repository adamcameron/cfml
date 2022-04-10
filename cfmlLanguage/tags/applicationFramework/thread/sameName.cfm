<cfthread action="run" name="thread1" arg1="arg1Val" arg2="arg2Val" arg3="arg3Val">
	<!--- nowt --->
	<cfset request.threadname= thread.name>
</cfthread>
<cfthread action="join" name="thread1" />

<cfthread action="run" name="thread2" arg1="arg1Val" arg2="arg2Val" arg3="arg3Val">
	<!--- nowt --->
</cfthread>
<cfthread action="join" name="thread2" />

<cfdump var="#cfthread#">
<cfdump var="#request#">