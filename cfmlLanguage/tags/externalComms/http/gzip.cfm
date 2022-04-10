<cfhttp method="get" url="http://www.espncricinfo.com" result="stHttp">
	<cfhttpparam type="header" name="accept-encoding" value="gzip">
</cfhttp>

<cfdump var="#stHttp#">