<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfoutput>
	<pre>#oCv.viewObject(createObject("component", "shared.cf.data_types.cv.cf.ClassViewer"))#</pre>
</cfoutput>