<cfoutput>
	<cfflush interval="2">
	Before#repeatString(" ", 50)#<br />
	<cflock name="testLock" throwontimeout="true" timeout="10" type="readonly">
		In read-only#repeatString(" ", 50)#<br />
		<cflock name="testLock" throwontimeout="true" timeout="10" type="exclusive">
			In exclusive#repeatString(" ", 50)#<br />
		</cflock>
		After exclusive#repeatString(" ", 50)#<br />
	</cflock>
	After read-only#repeatString(" ", 50)#<br />
	After#repeatString(" ", 50)#<br />
</cfoutput>
