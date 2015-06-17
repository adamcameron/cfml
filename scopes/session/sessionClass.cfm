<cfinclude template="/pfdevtest/Application.cfm">
<cfset oSessionCollection = createObject("java", "coldfusion.runtime.SessionTracker").getSessionCollection(application.ApplicationName)>
<!--- <cfset oSession = oSessionCollection[1]> --->

<!--- <cfdump var="#oSessionCollection#">
<cfabort> --->
<cfset oCv = createObject("java", "ClassViewer")>

<cfoutput>
<pre>
	#oCv.viewObject(oSessionCollection)#
</pre>
</cfoutput>
