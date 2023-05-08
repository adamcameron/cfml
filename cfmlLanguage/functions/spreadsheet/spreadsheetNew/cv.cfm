<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset oSpreadsheet = SpreadsheetNew("CourseData")>
<cfoutput>
<pre>
#oCv.viewObject(oSpreadsheet)#
</pre>
</cfoutput>
