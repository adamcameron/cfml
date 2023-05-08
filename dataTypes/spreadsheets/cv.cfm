<cfset oCv		= createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset oXlsSheet= spreadsheetNew("CourseData")>
<pre>
<cfoutput>#oCv.viewObject(oXlsSheet)#</cfoutput>
</pre>
