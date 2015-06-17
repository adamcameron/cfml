<cfset oCv = createObject("java", "ClassViewer")>
<cfoutput>
	<pre>#oCv.viewObject(createObject("component", "shared.cf.data_types.cv.cf.ClassViewer"))#</pre>
</cfoutput>