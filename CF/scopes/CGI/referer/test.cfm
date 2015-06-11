<cfoutput>
isDefined("CGI.http_referer"): [#isDefined("CGI.http_referer")#]<br />
structKeyExists(CGI, "http_referer"): [#structKeyExists(CGI, "http_referer")#]<br />
CGI.http_referer: [#CGI.http_referer#]<br />
</cfoutput>
<cfdump var="#CGI#">