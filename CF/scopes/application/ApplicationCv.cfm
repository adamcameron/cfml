<cfapplication name="test">
<cfdump var="#application.getApplicationSettings()#">

<cfset oCv = createObject("java", "ClassViewer")>

<cfoutput>
<pre>
#oCv.viewObject(server)#
</pre>
</cfoutput>
