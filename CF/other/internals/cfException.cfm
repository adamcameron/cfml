<cfset o = createObject("java", "coldfusion.debugger.CFDebuggerUtils")>
<cfset oCv = createObject("java", "ClassViewer")>

<cfdump var="#o#">
<cftry>
<pre>
<cfoutput>
#oCv.viewObject(o)#
</cfoutput>
</pre>
<cfcatch>viewObject() errored<br /></cfcatch>
</cftry>
