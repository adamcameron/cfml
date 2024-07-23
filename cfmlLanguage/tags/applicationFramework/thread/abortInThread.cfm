<cfset cfthread.mainline.before = true>
<cfthread action="run" name="t1">
	<cfset cfthread.t1.start = true>
	<cfabort>
	<cfset cfthread.t1.finish = true>
</cfthread>
<cfthread action="join" name="t1" timeout="1000" />
<cfset cfthread.mainline.after = true>

<cfdump var="#cfthread#" label="XXXXX">