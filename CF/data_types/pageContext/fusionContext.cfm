<cfset cv = createObject("java", "ClassViewer")>
<cfset fc = getPageContext().getFusionContext()>

<pre>
<cfoutput>
#cv.viewObject(fc)#
</cfoutput>
</pre>

<cfdump var="#fc#">
