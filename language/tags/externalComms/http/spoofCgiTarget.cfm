<cfoutput>
	CGI.remote_addr: #CGI.remote_addr#<br />
	CGI.http_remote_addr: #CGI.http_remote_addr#<br />
	CGI.http_referer: #CGI.http_referer#<br />
	CGI.http_foo: #CGI.http_foo#<br />
	CGI.foo: #CGI.foo#<br />
	<hr />
	<cfloop collection="#CGI#" item="sKey">
		CGI.#sKey#: #CGI[sKey]#<br />
	</cfloop>
</cfoutput>