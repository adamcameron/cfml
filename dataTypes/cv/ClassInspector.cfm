<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<pre>
<cfoutput>
#cv.viewObject(o)#	<!--- where o is a string, struct, query, getPageContext() (which is a good one), whatever --->
</cfoutput>
</pre>