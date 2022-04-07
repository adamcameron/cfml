<cfinclude template="/pfdevtest/Application.cfm">
<cfset oSessionCollection = createObject("java", "coldfusion.runtime.SessionTracker").getSessionCollection(application.ApplicationName)>
<!--- <cfset oSession = oSessionCollection[1]> --->

<!--- <cfdump var="#oSessionCollection#">
<cfabort> --->
<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfoutput>
<pre>
	#oCv.viewObject(oSessionCollection)#
</pre>
</cfoutput>
