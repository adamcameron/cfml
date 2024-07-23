<cfapplication name="lockTest_#createUuid()#" applicationtimeout="#createTimespan(0,0,0,10)#">
<cfflush interval="1">
Before outer read-only application-scope lock<br>
<cflock scope="application" type="readonly" timeout="1">
	Within outer read-only application-scope lock<br>
	Before inner read-only application-scope lock<br>
	<cflock scope="application" type="readonly" timeout="1">
		Within inner read-only application-scope lock<br>
	</cflock>
	After inner read-only application-scope lock<br>
</cflock>
After outer read-only application-scope lock<br>
END<br>