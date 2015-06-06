<cfset cv = createObject("java","ClassViewer")>
<cfset o = getPageContext()>
<cfoutput>
	<pre>#cv.viewObject(o)#</pre>
	<hr />
	<pre>#cv.viewObject(o.getResponse())#</pre>
</cfoutput>