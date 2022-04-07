<cfhttp method="post" url="http://localhost/rest/secureAppRestApi/Secure/login/" port="8500">
	<cfhttpparam type="formfield" name="username" value="admin">
	<cfhttpparam type="formfield" name="password" value="admin">

	<cfhttpparam type="cookie" name="cfid" value="#cookie.cfid#">
	<cfhttpparam type="cookie" name="cftoken" value="#cookie.cftoken#">
</cfhttp>

<cfdump var="#cfhttp#">
<cfhttp method="get" url="http://localhost/rest/secureAppRestApi/Secure/needsAdminAccess/" port="8500">
	<cfhttpparam type="cookie" name="cfid" value="#cookie.cfid#">
	<cfhttpparam type="cookie" name="cftoken" value="#cookie.cftoken#">
</cfhttp>

<cfdump var="#cfhttp#">
