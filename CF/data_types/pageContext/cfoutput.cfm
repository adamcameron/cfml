<cfset oCv = createObject("java", "ClassViewer")>
<cfset o = getPageContext().getCFOutput()>
<pre>
<cfoutput>
#oCv.viewObject(o)#
</cfoutput>
</pre>
<cfdump var="#o#">