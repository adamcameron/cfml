<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset req = getPageContext().getRequest()>

<pre>
<cfoutput>
#cv.viewObject(req)#
</cfoutput>
</pre>

<cfdump var="#req#">
