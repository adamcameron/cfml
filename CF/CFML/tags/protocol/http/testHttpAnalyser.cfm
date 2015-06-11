<cfhttp method="get" url="http://#cgi.server_name#:#cgi.server_port#/shared/cf/cfml/G-I/http/targetResource.cfm" result="stHttp"></cfhttp>
<cfdump var="#stHttp#" label="stHttp">