<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset o = getPageContext().getCFOutput()>
<pre>
<cfoutput>
#oCv.viewObject(o)#
</cfoutput>
</pre>
<cfdump var="#o#">