<cfset name = "Zachary">

<cfhttp method="get" url="http://localhost:8500/rest/components/greet/inNewZealandEnglish/#name#" result="response" />
<cfdump var="#response#">
<hr>

<cfhttp method="get" url="http://localhost:8500/rest/components/greet/inMaori/#name#" result="response" />
<cfdump var="#response#">
<hr>
