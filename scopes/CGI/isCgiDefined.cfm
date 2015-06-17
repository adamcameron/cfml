<cfoutput>
	isDefined("cgi.foo"): #isDefined("cgi.foo")#<br />
	structKeyExists(cgi, "foo"): #structKeyExists(cgi, "foo")#<br />
	[##cgi.foo##]: [#cgi.foo#]<br />
</cfoutput>
