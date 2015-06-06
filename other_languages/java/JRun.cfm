<cfset oJRun = createObject("java", "jrunx.kernel.JRun")>
<cfset oCv = createObject("java", "ClassViewer")>
<cfdump var="#oJRun#">
<cfoutput>
	<pre>
		<!--- #oCv.viewObject(oJRun)# --->
	</pre>
	<hr />
	<!--- o.getServerName(): [#oJRun.getServerName()#]<br /> --->
</cfoutput>

<cfdump var="#oJRun.server.getAttributes()#">