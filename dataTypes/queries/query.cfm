<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<pre>
<cfoutput>#cv.viewObject(queryNew(""))#</cfoutput>
</pre>

<cfsetting showdebugoutput="no">