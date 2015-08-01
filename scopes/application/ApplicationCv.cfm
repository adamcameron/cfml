<cfapplication name="test">
<cfdump var="#application.getApplicationSettings()#">

<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfoutput>
<pre>
#oCv.viewObject(server)#
</pre>
</cfoutput>
