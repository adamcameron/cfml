<!--- returnsArray.cfm --->

<cfhttp method="get" url="http://#CGI.http_host#/rest/components/arrayTest/returnsArray" result="array" />
<cfdump var="#array#">

