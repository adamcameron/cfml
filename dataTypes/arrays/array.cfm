<cfset cv = createObject("java", "ClassViewer")>

<cfset a = arrayNew(1)>

<pre>
<cfoutput>
#cv.viewObject(a)#
</cfoutput>
</pre>
