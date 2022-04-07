<cfset o = createObject("java", "coldfusion.debugger.CFDebuggerUtils")>
<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfdump var="#o#">
<cftry>
<pre>
<cfoutput>
#oCv.viewObject(o)#
</cfoutput>
</pre>
<cfcatch>viewObject() errored<br /></cfcatch>
</cftry>
