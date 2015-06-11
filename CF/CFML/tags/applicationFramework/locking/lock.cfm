<cflock name="testLock" timeout="5" throwontimeout="yes" type="exclusive">
	Hello World
</cflock>