<cfapplication name="lockTest_#createUuid()#" applicationtimeout="#createTimespan(0,0,0,10)#">
<cfflush interval="1">
Before read-only application-scope lock<br>
<cflock scope="application" type="readonly" timeout="1">
	Within read-only application-scope lock<br>
	Before exclusive application-scope lock<br>
	<cflock scope="application" type="exclusive" timeout="1">
		Within exclusive application-scope lock<br>
	</cflock>
	After exclusive application-scope lock<br>
</cflock>
After read-only application-scope lock<br>
END<br>