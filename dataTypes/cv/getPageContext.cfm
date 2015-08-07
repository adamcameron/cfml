<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<pre>
<cfoutput>
#oCv.viewObject(getPageContext())#
</cfoutput>
</pre>

<cfdump var="#getPageContext()#">
