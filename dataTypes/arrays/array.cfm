<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfset a = arrayNew(1)>

<pre>
<cfoutput>
#cv.viewObject(a)#
</cfoutput>
</pre>
