<cfset oCv		= createObject("java", "ClassViewer")>
<cfset oXlsSheet= spreadsheetNew("CourseData")>
<pre>
<cfoutput>#oCv.viewObject(oXlsSheet)#</cfoutput>
</pre>
