<cfset cv = createObject("java", "ClassViewer")>
<cfset response = getPageContext().getResponse()>

<pre>
<cfoutput>
#cv.viewObject(response)#
</cfoutput>
</pre>

<cfdump var="#response#">
