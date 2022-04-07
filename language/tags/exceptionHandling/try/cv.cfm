<cftry>
	<cfthrow>
	<cfcatch>
		<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
		<cfoutput>
			<pre>#oCv.viewObject(cfcatch)#</pre>
		</cfoutput>
	</cfcatch>
</cftry>