<cfthread action="run" name="t1">
	<cfset cfthread.t1.ts	= now()>
	<cfset cfthread.t1.done = false>
	<cfset createObject("webservice", "http://localhost:8888/testing/ws.cfc?wsdl").sleep(duration=3000)>
	<cfset cfthread.t1.done = true>
</cfthread>
<cfdump var="#cfthread#" label="After RUN">

<cfthread action="join" name="t1" timeout="2000" />
<cfdump var="#cfthread#" label="After JOIN">

<cfif not cfthread.t1.done>
	<cfthread action="terminate" name="t1" />
	Thread killed<br />
	<cfdump var="#cfthread#" label="After TERMINATE">
<cfelse>
	Thread completed OK<br />
</cfif>
