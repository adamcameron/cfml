<cflock timeout="1" throwontimeout="yes" type="exclusive">
	<cfoutput>
		Start Sleep @ #timeFormat(now(), "HH:mm:ss")#<br />
		<cfset createObject("java", "java.lang.Thread").sleep(10000)>
		Wake up @ #timeFormat(now(), "HH:mm:ss")#<br />
	</cfoutput>
</cflock>