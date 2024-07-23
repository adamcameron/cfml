<cfflush interval="1">
Before outer read-only named lock<br>
<cflock name="myLock" type="readonly" timeout="1">
	Within outer read-only named lock<br>
	Before inner read-only named lock<br>
	<cflock name="myLock" type="readonly" timeout="1">
		Within inner read-only named lock<br>
	</cflock>
	After inner read-only named lock<br>
</cflock>
After outer read-only named lock<br>
END<br>