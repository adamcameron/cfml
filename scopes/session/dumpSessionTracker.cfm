<cfset sessionTracker = createObject("java", "coldfusion.runtime.SessionTracker")>
<cfdump var="#sessionTracker#">

<pre>
<cfoutput>#createObject("java", "me.adamcameron.miscellany.ClassViewer").viewObject(sessionTracker)#</cfoutput>
</pre>

<cfset sessionTracker.cleanUp("", "")>