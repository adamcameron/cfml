<cftry>
	Before lock<br>
	<cflock name="l1" type="exclusive" timeout="2" result="result">
		Somehow got the lock<br>
	</cflock>
	After lock<br>
<cfcatch>
	<cfdump var="#[
		type = cfcatch.type,
		message = cfcatch.message,
		detail = cfcatch.detail
	]#">
	<cfdump var="#result#">
</cfcatch>
</cftry>
END<br>
