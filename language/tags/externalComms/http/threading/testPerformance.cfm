<cfset results = []>
<cfset testPath = listDeleteAt(CGI.script_name, listLen(CGI.script_name, "/"), "/")>
<cfset testUrl = "http://localhost:#CGI.server_port##testPath#/echoTicks.cfm?requestId=">

<cfset startTime = getTickCount()>

<cfhttp method="GET" url="#testUrl#0" result="httpResponse" />

<cfset remoteStartTime = listLast(httpResponse.fileContent, ":")>
<cfset arrayAppend(results, {t="t0", localTime=getTickCount()-startTime, remoteTime=0, remoteid=listFirst(httpResponse.fileContent, ":")})>

<cfset startTime = getTickCount()>
<cfloop index="i" from="1" to="5">
	<cfthread action="run" name="t#i#">
		<!---<cfhttp method="GET" url="#testUrl##i#" result="threadHttpResponse" />--->
		<cfscript>
		threadHttpResponse.fileContent = "#i#:#getTickCount()#";
		telemetry = structNew();
		telemetry.t = thread.name;
		telemetry.ts=getTickCount()-startTime;
		telemetry.remoteTime=listLast(threadHttpResponse.fileContent, ":")-remoteStartTime;
		telemetry.remoteid=listFirst(threadHttpResponse.fileContent, ":");
		arrayAppend(results, telemetry);
		</cfscript>
	</cfthread>
</cfloop>

<cfloop index="i" from="1" to="5">
	<cfthread action="join" name="t#i#" />
</cfloop>

<cfdump var="#results#">