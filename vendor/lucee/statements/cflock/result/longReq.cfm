Before lock<br>
<cflock name="l1" type="exclusive" timeout="0" result="result">
	Before sleep<br>
	<cfset sleep(10000)>
	After sleep<br>
</cflock>
After lock<br>
<cfdump var="#result#">
END<br>
