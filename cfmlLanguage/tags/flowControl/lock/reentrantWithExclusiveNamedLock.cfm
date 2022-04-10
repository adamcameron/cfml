<cfflush interval="1">
Before read-only named lock<br>
<cflock name="myLock" type="readonly" timeout="1">
	Within read-only named lock<br>
	Before exclusive named lock<br>
	<cflock name="myLock" type="exclusive" timeout="1">
		Within exclusive named lock<br>
	</cflock>
	After exclusive named lock<br>
</cflock>
After read-only named lock<br>
END<br>