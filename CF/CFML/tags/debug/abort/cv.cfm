<cftry>
	<cfabort showerror="abort showerror">
	<cfcatch>
		<cfset oCv = createObject("java", "ClassViewer")>
		<cfoutput>
			<pre>#oCv.viewObject(cfcatch)#</pre>
		</cfoutput>
	</cfcatch>
</cftry>