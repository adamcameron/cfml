

<cfset oCv = createObject("java", "ClassViewer")>
<cfoutput>
	<pre>
		#oCv.viewObject(getPageContext())#
	</pre>
</cfoutput>

