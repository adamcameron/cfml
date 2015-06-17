<cfset cv = createObject("java", "ClassViewer")>
<cfset req = getPageContext().getRequest()>

<pre>
<cfoutput>
#cv.viewObject(req)#
</cfoutput>
</pre>

<cfdump var="#req#">
