<cfset oCv = createObject("java", "ClassViewer")>
<pre>
<cfoutput>
#oCv.viewObject(getPageContext())#
</cfoutput>
</pre>

<cfdump var="#getPageContext()#">
