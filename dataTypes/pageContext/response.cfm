<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset response = getPageContext().getResponse()>

<pre>
<cfoutput>
#cv.viewObject(response)#
</cfoutput>
</pre>

<cfdump var="#response#">
