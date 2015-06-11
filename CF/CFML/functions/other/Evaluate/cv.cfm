<cfset oCv = createObject("java", "ClassViewer")>
<cfset o = createObject("java", "coldfusion.compiler.EvaluateFunction")>

<cftry>
	<cfset o.init()>
<cfoutput>
<pre>
#oCv.viewObject(o)#
</pre>
</cfoutput>
<cfcatch>
<cfdump var="#o#">
</cfcatch>
</cftry>