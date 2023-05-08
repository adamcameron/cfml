<cfsilent>
	<cfapplication name="testLock" sessionmanagement="true">
	<cfparam name="session.iStart" default="#getTickCount()#">

	<cfparam name="URL.iDelay" default="200">
	<cfset oThread = createObject("java", "java.lang.Thread")>

	<cfset request.sFile = getDirectoryFromPath(getCurrentTemplatePath()) & "log.dat">
	<cffunction name="timeStamp" output="false" returntype="string">
		<cfargument name="msg" type="string" required="true">
		<cfset var sLog = "#getTickCount() - session.iStart#: #arguments.msg#">
		<cffile action="append" file="#request.sFile#" output="#sLog#" addnewline="true">
		<cfreturn sLog>
	</cffunction>


	<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
	<cfflush interval="50">
</cfsilent>
<cfoutput>
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="expires" content="tue, 04 jan 2000 1:00:00 gmt">
</head>
<body>
	#timeStamp('(#url.id#) Before outer lock')#<br /><cfflush>
	<cflock name="globallockthatbreaks" type="exclusive" timeout="10" throwontimeout="true">
		#timeStamp('(#url.id#) Top of outer lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>

		#timeStamp('(#url.id#) Before inner lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
		<cflock name="globallockthatbreaks" type="exclusive" timeout="10" throwontimeout="true">
			#timeStamp('(#url.id#) Within inner lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
		</cflock>
		#timeStamp('(#url.id#) After inner lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>

		#timeStamp('(#url.id#) Before outer stall lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
		<cflock name="stall_out_#id#" throwontimeout="yes" timeout="1" type="readonly">
			#timeStamp('(#url.id#) Top of outer stall lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
			<cftry>
				#timeStamp('(#url.id#) Before inner stall lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
				<cflock name="stall_out_#id#" throwontimeout="no" timeout="2" type="exclusive">
					#timeStamp('(#url.id#) Within inner stall lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
				</cflock>
				#timeStamp('(#url.id#) After inner stall lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
				<cfcatch>
					#timeStamp('(#url.id#) Exception caught: [#cfcatch.message#]')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
				</cfcatch>
			</cftry>
			#timeStamp('(#url.id#) Bottom of outer stall lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>
		</cflock>
		#timeStamp('(#url.id#) After outer stall lock')#<br /><cfflush><cfset oThread.sleep(url.iDelay)>

		<cfset oThread.sleep(url.iDelay)>#timeStamp('(#url.id#) Bottom of outer lock')#<br /><cfflush>
	</cflock>
	#timeStamp('(#url.id#) After outer lock')#<br /><cfflush>
	<cfset session.bComplete = true>
	END<br />
</body>
</html>
</cfoutput>
