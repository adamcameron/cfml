<cfset sessionTracker = createObject("java", "coldfusion.runtime.SessionTracker")>
<cfdump var="#sessionTracker#">

<pre>
<cfoutput>#createObject("java", "ClassViewer").viewObject(sessionTracker)#</cfoutput>
</pre>

<cfset sessionTracker.cleanUp("", "")>