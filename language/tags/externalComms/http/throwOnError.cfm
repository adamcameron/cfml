<cfhttp method="get" URL="http://localhost:8300/shared/cf/cfml/cfhttp/exists.txt" result="stGood" throwonerror="true">
</cfhttp>

<cfdump var="#stGood#">

<cfhttp method="get" URL="http://localhost:8300/shared/cf/cfml/cfhttp/not_exists.txt" result="stBad" throwonerror="true">
</cfhttp>

<cfdump var="#stBad#">