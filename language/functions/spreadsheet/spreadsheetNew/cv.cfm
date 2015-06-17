<cfset oCv = createObject("java", "ClassViewer")>
<cfset oSpreadsheet = SpreadsheetNew("CourseData")>
<cfoutput>
<pre>
#oCv.viewObject(oSpreadsheet)#
</pre>
</cfoutput>
