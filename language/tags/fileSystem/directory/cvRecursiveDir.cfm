<cfset oCv	= createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset oRd	= createObject("java", "RecursiveDir").init()>
<cfoutput>
<pre>
#oCv.viewObject(oRd)#
</pre>

</cfoutput>