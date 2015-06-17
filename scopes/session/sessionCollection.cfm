<cfinclude template="/pfdevtest/Application.cfm">

<!--- Use an array to setup some Java reflection --->
<cfset aReflect = arrayNew(1)>

<cfset clSession = aReflect.getClass().forName("coldfusion.runtime.SessionScope")>

<cfset stSessionReflect = StructNew()>
<!--- These methods can be used without updating the Last access time --->
<cfset stSessionReflect.elapsedTime = clSession.getMethod('getElapsedTime', aReflect)>
<cfset stSessionReflect.lastAccess = clSession.getMethod('getTimeSinceLastAccess', aReflect)>
<cfset stSessionReflect.maxInterval = clSession.getMethod('getMaxInactiveInterval', aReflect)>
<cfset stSessionReflect.expired = clSession.getMethod('expired', aReflect)>

<!--- Setup the Session Tracker --->
<cfset oSessionTracker = CreateObject('java', 'coldfusion.runtime.SessionTracker')>

<!--- Grab a reference to the sessions --->
<cfset stSessions = oSessionTracker.getSessionCollection(application.ApplicationName)>
<!--- We'll store the session information in a query --->
<cfset qSession = queryNew('sessionId,elapsedTime,lastAccess,maxInterval,expired')>
<cfloop item="sSession" collection="#stSessions#">
	<cfset QueryAddRow(qSession, 1)>
	<!--- sid = Session ID --->
	<cfset querySetCell(qSession, 'sessionId', sSession, qSession.recordCount)>
	<cftry>
		<!--- elapsedTime and lastAccess are in ms, maxInterval is in seconds, expired is tinyint --->
		<cfset querySetCell(qSession, 'elapsedTime', stSessionReflect.elapsedTime.invoke(stSessions[sSession], aReflect), qSession.recordCount)>
		<cfset querySetCell(qSession, 'lastAccess', stSessionReflect.lastAccess.invoke(stSessions[sSession], aReflect), qSession.recordCount)>
		<cfset querySetCell(qSession, 'maxInterval', stSessionReflect.maxInterval.invoke(stSessions[sSession], aReflect) * 1000, qSession.recordCount)>
		<cfset querySetCell(qSession, 'expired', stSessionReflect.expired.invoke(stSessions[sSession], aReflect), qSession.recordCount)>
		<cfcatch type="any">
			<!--- Something went wrong with this session, leave the values blank apart from the sessionID --->
		</cfcatch>
	</cftry>
</cfloop>

<!--- We can do things like calculate the percentage of time left until expiry --->
<cfquery name="qSession" dbtype="query">
SELECT *, lastAccess / maxInterval / 100 AS percent FROM qSession ORDER BY lastAccess DESC
</cfquery>

<cfdump var="#qSession#">