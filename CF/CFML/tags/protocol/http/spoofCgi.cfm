<cfhttp method="get" url="http://localhost:#CGI.server_port#/shared/cf/cfml/H/http/spoofCgiTarget.cfm" result="stHttp">
 	<cfhttpparam type="header" name="HTTP_REFERER" value="http://www.12robots.com/myAdminPage.cfm">
	<cfhttpparam type="header" name="REMOTE_HOST" value="12.34.56.78">
	<cfhttpparam type="header" name="FOO" value="bar">
 </cfhttp>
<cfoutput>#stHttp.fileContent#</cfoutput>
<!--- <cfdump var="#stHttp#"> --->