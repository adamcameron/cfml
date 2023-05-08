

<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfoutput>
	<pre>
		#oCv.viewObject(getPageContext())#
	</pre>
</cfoutput>

