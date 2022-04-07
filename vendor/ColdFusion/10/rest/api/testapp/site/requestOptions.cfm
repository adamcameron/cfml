<cfparam name="URL.CFC">
<cfhttp method="options" url="http://localhost:8500/rest/testAppRestApi/#URL.CFC#/" result="stResult"></cfhttp>
<cfcontent type="text/xml" reset="true">
<cfoutput>#stResult.fileContent#</cfoutput>