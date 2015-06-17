<cfset cv = createObject("java", "ClassViewer")>

<pre>
<cfoutput>#cv.viewObject(queryNew(''))#</cfoutput>
</pre>

<cfsetting showdebugoutput="no">