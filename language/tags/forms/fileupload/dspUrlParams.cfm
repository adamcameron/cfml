<cfset sUrlParams = urlEncodedFormat("param1=foo&param2=bar")>
<cffileupload url="./actUrlParams.cfm?#sUrlParams#">
