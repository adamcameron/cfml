<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset fc = getPageContext().getFusionContext()>

<pre>
<cfoutput>
#cv.viewObject(fc)#
</cfoutput>
</pre>

<cfdump var="#fc#">
