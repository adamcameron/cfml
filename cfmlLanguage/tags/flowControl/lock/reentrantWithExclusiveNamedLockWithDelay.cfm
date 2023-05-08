<cfapplication name="testObdLocks01" applicationtimeout="#createTimespan(0,0,0,10)#">

<cfparam name="application.requestCount" default="0">
<cfset request.count = ++application.requestCount>
	
<cfset writeMessage("Before read-only named lock")>
<cftry>
	<cflock name="myLock" type="readonly" timeout="20">
		<cfset writeMessage("Within read-only named lock")>
		<cfset sleep(5000)>
		<cfset writeMessage("Before exclusive named lock")>
		<cflock name="myLock" type="exclusive" timeout="20">
			<cfset writeMessage("Top of exclusive named lock")>
			<cfset sleep(5000)>
			<cfset writeMessage("Bottom of exclusive named lock")>
		</cflock>
		<cfset writeMessage("After exclusive named lock")>
	</cflock>
	<cfcatch>
		<cfset writeMessage("Exception occurred: #cfcatch.type# #cfcatch.message# #cfcatch.detail#")>
		<cfrethrow>
	</cfcatch>
</cftry>

<cfset writeMessage("After read-only named lock")>
<cfset writeMessage("END")>

<cfscript>
	function writeMessage(message){
		var ts = timeFormat(now(), "HH:MM:SS.LLL");
		message = "Request: #request.count#: #ts# : #message#";
		writeLog(file=application.applicationname, text=message);
		writeOutput(message & "<br>");
	}
</cfscript>